
Spree::Product.class_eval do

  alias :original_var_attr= :variants_attributes= #backup the ancient varattr=

  attr_accessible :is_discovery

  self.scope("two_last_added", relation.order("#{Spree::Product.quoted_table_name}.created_at DESC").limit(2))
  self.scope("discovery", where(:is_discovery => true))

  after_save :delete_extra_master_variant #method to avoid the double variant, due to nested master
  before_save :ensure_uniqueness_of_discovery #method to clean other discoveries
  after_update :update_master_price #be sure that product master price will correspond to lower option value

  def ensure_uniqueness_of_discovery
    if(self.is_discovery)
      Spree::Product.discovery.each do |prod|
        prod.is_discovery = false
        prod.save
      end
    end
  end

  def delete_extra_master_variant #as spree create automatically the master variant on product creation, we've to delete it. Nifty thing.
    return unless (self.variants_including_master.where(:is_master => true).size > 1)
    self.variants_including_master.where(:is_master => true).each do |m_var|
      m_var.images.empty? ? m_var.destroy : self.master = m_var
    end
    update_master_price
  end

  def update_master_price
    #We display default price and default variant on the customer interface according to lower variant option value (tailleEcran,memory, longueurCable)
    #To be sure price will fit with first variant op val returned by method option_values below.
    self.master.price = self.variants.joins(:option_values).order("#{Spree::OptionValue.quoted_table_name}.presentation ASC").first.price
    self.master.save
  end

  def variants_attributes=(variants_attrs) #because a product in spree cannot recognize its master variant from attribute is_master in the form
    if(!self.new_record?) #because on hand calcul raise nil exception on a non initialized product variant
      variants_attrs.each do |key,value|
        if value[:is_master]
          self.master.update_attributes(value)   
          variants_attrs.delete(key)
        end
      end
    end
    self.original_var_attr = variants_attrs
  end
  
  def option_values #option not options: one option per product prototype
    ov = []
    self.variants.each do |v|
      ov<<[v.price,v.option_values.pluck(:presentation).first,v.id,v.reduction] #to modify if multiple OV for a variant
    end
    ov.sort_by {|object| object.second.to_i}
  end
  
  def is_new?
    ((Time.now - self.created_at)/(3600*24))>30
  end
end