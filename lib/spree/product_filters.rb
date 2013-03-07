module Spree
  # THIS FILE SHOULD BE OVER-RIDDEN IN YOUR SITE EXTENSION!
  #   the exact code probably won't be useful, though you're welcome to modify and reuse
  #   the current contents are mainly for testing and documentation

  # To override this file...
  #   1) Make a copy of it in your sites local /lib/spree folder
  #   2) Add it to the config load path, or require it in an initializer, e.g...
  #
  #      # config/initializers/spree.rb
  #      require 'spree/product_filters'
  #

  # set up some basic filters for use with products
  #
  # Each filter has two parts
  #  * a parametrized named scope which expects a list of labels
  #  * an object which describes/defines the filter
  #
  # The filter description has three components
  #  * a name, for displaying on pages
  #  * a named scope which will 'execute' the filter
  #  * a mapping of presentation labels to the relevant condition (in the context of the named scope)
  #  * an optional list of labels and values (for use with object selection - see taxons examples below)
  #
  # The named scopes here have a suffix '_any', following SearchLogic's convention for a
  # scope which returns results which match any of the inputs. This is purely a convention,
  # but might be a useful reminder.
  #
  # When creating a form, the name of the checkbox group for a filter F should be
  # the name of F's scope with [] appended, eg "price_range_any[]", and for
  # each label you should have a checkbox with the label as its value. On submission,
  # Rails will send the action a hash containing (among other things) an array named
  # after the scope whose values are the active labels.
  #
  # SearchLogic will then convert this array to a call to the named scope with the array
  # contents, and the named scope will build a query with the disjunction of the conditions
  # relating to the labels, all relative to the scope's context.
  #
  # The details of how/when filters are used is a detail for specific models (eg products
  # or taxons), eg see the taxon model/controller.

  # See specific filters below for concrete examples.

  # This module is included by Taxon. In development mode that inclusion does not
  # happen until Taxon class is loaded. Ensure that Taxon class is loaded before
  # you try something like Product.price_range_any
  module ProductFilters
    # Example: filtering by price
    #   The named scope just maps incoming labels onto their conditions, and builds the conjunction
    #   'price' is in the base scope's context (ie, "select foo from products where ...") so
    #     we can access the field right away
    #   The filter identifies which scope to use, then sets the conditions for each price range
    #
    # If user checks off three different price ranges then the argument passed to
    # below scope would be something like ["$10 - $15", "$15 - $18", "$18 - $20"]
    #
    #SUPER EXEMPLE:https://gist.github.com/Ranger-X/2511088

    #product with SPECIFIC option values
    def ProductFilters.option_with_values(option_scope, option, values)
      # get values IDs for Option with name {@option} and value-names in {@values} for use in SQL below
      option_values = Spree::OptionValue.where(:presentation => [values].flatten).joins(:option_type).where(OptionType.table_name => {:name => option}).pluck("#{OptionValue.table_name}.id")
      return option_scope if option_values.empty?

      option_scope = option_scope.where("#{Product.table_name}.id in (select product_id from #{Variant.table_name} v left join spree_option_values_variants ov on ov.variant_id = v.id where ov.option_value_id in (?))", option_values)
      option_scope
    end

    # option scope
    Spree::Product.scope :option_any,
    lambda { |*opts|
      option_scope = Spree::Product.includes(:variants_including_master)

      opts.map { |opt|
        # opt is an array => ['option-name', [value1, value2, value3, ...]]
        option_scope = option_with_values(option_scope, *opt)
      }
      option_scope
    }

    #product with RANGE option values
    
    def option_in_range(option_scope, option, values)
      # get values IDs for Option with name {@option} and value-names in {@values} for use in SQL below
      option_values = Spree::OptionValue.where("CAST(coalesce(#{OptionValue.table_name}.presentation, '0') AS integer) > ? AND CAST(coalesce(#{OptionValue.table_name}.presentation, '0') AS integer) < ?",values.first, values.second).joins(:option_type).where(OptionType.table_name => {:name => option}).pluck("#{OptionValue.table_name}.id")
      return option_scope if option_values.empty?
      option_scope = option_scope.where("#{Product.table_name}.id in (select product_id from #{Variant.table_name} v left join spree_option_values_variants ov on ov.variant_id = v.id where ov.option_value_id in (?))", option_values)
      option_scope
    end

    # option scope
    Spree::Product.scope :option_any_in_range,
    lambda { |*opts|
      option_scope = Spree::Product.includes(:variants_including_master)

      opts.map { |opt|
        # opt is an array => ['option-name', [value1, value2, value3, ...]]
        option_scope = option_in_range(option_scope, *opt)
      }
      option_scope
    }


    # size option
    def ProductFilters.screenSize_filter
      sizes = Spree::OptionValue.where(:option_type_id => Spree::OptionType.find_by_name("tailleEcran")).order("CAST(coalesce(#{OptionValue.table_name}.presentation, '0') AS integer)").map(&:presentation).compact.uniq
      {
        :name => "Ecran",
        :scope => :option_any,
        :conds => nil,
        :option => 'tailleEcran', # this is MANDATORY
        :class => "sizes",
        :labels => sizes.map { |k| [k, k] }
      }
    end

     Spree::Product.add_search_scope :screenSize_range_any do |*opts|
        conds = opts.map {|o| Spree::ProductFilters.screenSize_filter[:conds][o]}.reject {|c| c.nil?}
        scope = conds.shift
        conds.each do |new_scope|
          scope = scope.or(new_scope)
        end
        Spree::Product.joins(:master).where(scope)
      end

      def ProductFilters.screenSize_filter
        v = Spree::Variant.arel_table
        conds = [ [ "20p ou moins",["tailleEcran",["0","20"]]],
                  [ "20p - 30p",["tailleEcran",["20","30"]]],
                  [ "30p - 40p"   , ["tailleEcran",["20","30"]]],
                  [ "40p ou plus"   , ["tailleEcran",["20","30"]]]]
        { :name   => "taille",
          :scope  => :screenSize_range_any,
          :conds  => Hash[*conds.flatten],
          :labels => conds.map {|k,v| [k,k]}
        }
      end
      
  end
end
