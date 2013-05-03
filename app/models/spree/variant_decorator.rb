Spree::Variant.class_eval do
  accepts_nested_attributes_for :option_values
  accepts_nested_attributes_for :images
  attr_accessible :is_master, :images_attributes, :reduction
  validate :check_reduction
  validates :reduction, :numericality => { :greater_than_or_equal_to => 0,:less_than_or_equal_to => 100 }
  self.scope("in_promotion", where("reduction > ?", 0))
  
  def check_reduction
    if self.reduction.nil? || !(self.reduction.is_a? Integer)
      self.reduction = 0
    end
  end
  
  def price
    self[:price] - (self[:price]/100)*self[:reduction]
  end
  
end