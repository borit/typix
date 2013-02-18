class ProductsDiscovery < ActiveRecord::Migration
  def self.up
    # Ajout d'un champs pour stocker l'id du taxon
    #remove_column :spree_prototypes, "taxon_id"
    add_column :spree_products, "is_discovery",  :boolean
  end

  def self.down
    # suppressions
    remove_column :spree_products, "is_discovery"
    
  end
end