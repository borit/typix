
Spree::Prototype.class_eval do
  belongs_to :taxon
  attr_accessible :taxon, :taxon_id
end