Spree::Variant.class_eval do
  accepts_nested_attributes_for :option_values
  accepts_nested_attributes_for :images
  attr_accessible :is_master, :images_attributes
end