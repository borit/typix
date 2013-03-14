# Ajout du scope option_any à la classe product.

Spree::Product.scope :option_any,
lambda { |*opts| #to convert arg in array
  option_scope = Spree::Product.includes(:variants_including_master) #charge les produits et précharge les variantes 
  opts.map { |opt| 
    # opt is an array => ['option-name', [value1, value2, value3, ...]]
    option_scope = option_with_values(option_scope, *opt) #option scope recupere une liste de produit a chaque fois raffinée par option_with_value
  }
  option_scope
}
#Usage: Product.option_any ["tailleEcran",["42","12"]] retourne les produits ayant une taille écran de 42 et 12

def ProductFilters.option_with_values(option_scope, option, values) #option_scope est une liste de base pour la recherche
    
      # get values IDs for Option with name {@option} and value-names in {@values} for use in SQL below
      option_values = Spree::OptionValue.where(:presentation => [values].flatten).joins(:option_type).where(OptionType.table_name => {:name => option}).pluck("#{OptionValue.table_name}.id")
      #Spree::OptionValue.where(:presentation => [values].flatten) retourne toute les OV avec la presentation EX:OptionValue.where(:presentation=>["12","14"])
      #flatten: extrait les sous tableaux et en fait un tableau une dimension => permet de faire Product.option_any ["tailleEcran",["42",["12","23"]]]
      
      #.joins(:option_type) ajoute les option_type à la requête afin qu'il soit dispo pour effectuer un WHERE
      #.where(OptionType.table_name => {:name => option})
      #
      
      #.pluck("#{OptionValue.table_name}.id") selectionne les ids des option values qui ont matché
      
      
      #OptionValue.where(:presentation=>["12","14"]).joins(:option_type).where("spree_option_types" => {:name => "tailleEcran"})
      
      
      return option_scope if option_values.empty? # pas de modif au scoping de base si pas de ov matché
 
      option_scope = option_scope.where("#{Product.table_name}.id in (select product_id from #{Variant.table_name} v left join spree_option_values_variants ov on ov.variant_id = v.id where ov.option_value_id in (?))", option_values)
      option_scope
end

def ProductFilters.option_with_values(option_scope, option, values) #option_scope est une liste de base pour la recherche
    
      # get values IDs for Option with name {@option} and value-names in {@values} for use in SQL below
      option_values = Spree::OptionValue.where("CAST(coalesce(presentation, '0') AS integer) > ? AND CAST(coalesce(presentation, '0') AS integer) < ?",values.first, values.second).joins(:option_type).where(OptionType.table_name => {:name => option}).pluck("#{OptionValue.table_name}.id")

      return option_scope if option_values.empty? # pas de modif au scoping de base si pas de ov matché
 
      option_scope = option_scope.where("#{Product.table_name}.id in (select product_id from #{Variant.table_name} v left join spree_option_values_variants ov on ov.variant_id = v.id where ov.option_value_id in (?))", option_values)
      option_scope
end

#OLD version of option in range, only usable for an only range, no cumulation possible
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
