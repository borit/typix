class AddPromoVariantField < ActiveRecord::Migration
  def self.up
    # Ajout d'un champs pour stocker l'id du taxon
    #remove_column :spree_prototypes, "taxon_id"
    add_column :spree_variants, "reduction",  :integer
    Spree::Variant.update_all ["reduction = ?", 0]
  end
  

  def self.down
    # suppressions
    remove_column :spree_variants, "reduction"
    
  end
end