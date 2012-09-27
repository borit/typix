class PropertiesExtension < ActiveRecord::Migration
  def self.up
    # Ajout d'un champs pour stocker le type de propriété
    add_column :spree_properties, "value_type",  :string
  end

  def self.down
    remove_column :spree_properties, "value_type"
  end
end