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

    # size option

    def ProductFilters.ov_range_test(range1, range2)
      ov = Arel::Table.new(OptionValue.table_name)
      cast = Arel::Nodes::NamedFunction.new "CAST", [ ov[:presentation].as("integer")]
      comparaisons = cast.in(range1..range2)
      comparaisons
    end

    Spree::Product.add_search_scope :screenSize_range_any do |*opts|
      conds = opts.map {|o| Spree::ProductFilters.screenSize_filter[:conds][o]}.reject {|c| c.nil?}
      scope = conds.shift
      conds.each do |new_scope|
        scope = scope.or(new_scope)
      end
      option_values=Spree::OptionValue.where(scope).joins(:option_type).where(OptionType.table_name => {:name => "tailleEcran"}).pluck("#{OptionValue.table_name}.id")
      Spree::Product.where("#{Product.table_name}.id in (select product_id from #{Variant.table_name} v left join spree_option_values_variants ov on ov.variant_id = v.id where ov.option_value_id in (?))", option_values)
    end

    def ProductFilters.screenSize_filter
      conds = [ [ "20p ou moins",ov_range_test(0,20)],
      [ "20p - 30p",ov_range_test(20,30)],
      [ "30p - 40p" ,ov_range_test(30,40)],
      [ "40p ou plus",ov_range_test(40,190)]]
      { :name   => "taille",
        :scope  => :screenSize_range_any,
        :option => :tailleEcran,
        :conds  => Hash[*conds.flatten],
        :labels => conds.map {|k,v| [k,k]}
      }
    end

    #3D option
    if Spree::Property.table_exists?
      Spree::Product.add_search_scope :relief_scope do |*opts|
        conds = opts.map {|o| ProductFilters.threeD_filter[:conds][o]}.reject {|c| c.nil?}
        scope = conds.shift
        conds.each do |new_scope|
          scope = scope.or(new_scope)
        end
        Spree::Product.with_property("three_d").where(scope)
      end

      def ProductFilters.threeD_filter
        threeD_property = Spree::Property.find_by_name("three_d")
        #values = Spree::ProductProperty.where(:property_id => threeD_property).pluck(:value).uniq
        pp = Spree::ProductProperty.arel_table
        #conds = Hash[*values.map { |b| [b, pp[:value].eq(b)] }.flatten] not suitable for binary options
        conds = [ [ "2D",pp[:value].eq("0")],
        [ "3D",pp[:value].eq("1")]]
        { :name   => "2D&3D",
          :scope  => :relief_scope,
          :conds  =>  Hash[*conds.flatten],
          :labels => conds.map { |k,v| [k, k] }
        }
      end
    end
    #internet option
    if Spree::Property.table_exists?
      Spree::Product.add_search_scope :internet_scope do |*opts|
        conds = opts.map {|o| ProductFilters.internet_filter[:conds][o]}.reject {|c| c.nil?}
        scope = conds.shift
        conds.each do |new_scope|
          scope = scope.or(new_scope)
        end
        Spree::Product.with_property("internet").where(scope)
      end

      def ProductFilters.internet_filter
        threeD_property = Spree::Property.find_by_name("internet")
        #values = Spree::ProductProperty.where(:property_id => threeD_property).pluck(:value).uniq
        pp = Spree::ProductProperty.arel_table
        #conds = Hash[*values.map { |b| [b, pp[:value].eq(b)] }.flatten] not suitable for binary options
        conds = [ [ "internet?",pp[:value].eq("1")]]
        { :name   => "internet",
          :scope  => :internet_scope,
          :conds  =>  Hash[*conds.flatten],
          :labels => conds.map { |k,v| [k, k] }
        }
      end
    end
     #techno option
      if Spree::Property.table_exists?
        Spree::Product.add_search_scope :technology_scope do |*opts|
          conds = opts.map {|o| ProductFilters.internet_filter[:conds][o]}.reject {|c| c.nil?}
          scope = conds.shift
          conds.each do |new_scope|
            scope = scope.or(new_scope)
          end
          Spree::Product.with_property("technologie").where(scope)
        end

        def ProductFilters.internet_filter
          property = Spree::Property.find_by_name("technologie")
          values = Spree::ProductProperty.where(:property_id => property).pluck(:value).uniq
          pp = Spree::ProductProperty.arel_table
          conds = Hash[*values.map { |b| [b, pp[:value].eq(b)] }.flatten]
          { :name   => "Technologie",
            :scope  => :technology_scope,
            :conds  =>  Hash[*conds.flatten],
            :labels => conds.map { |k,v| [k, k] }
          }
        end
      end

  end
end
