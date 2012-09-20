class PrototypesExtension < ActiveRecord::Migration
  def self.up
    # Ajout d'un champs pour stocker l'id du taxon
    add_column :spree_prototypes, "taxon_id",  :integer
  end

  def self.down
    # Ajout d'un champs pour stocker l'id du taxon
    remove_column :spree_prototypes, "taxon_id"
  end
end