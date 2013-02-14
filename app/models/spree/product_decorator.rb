
Spree::Product.class_eval do

  alias :original_var_attr= :variants_attributes= #backup the ancient varattr=

  attr_accessible :is_discovery

  self.scope("two_last_added", relation.order("#{Spree::Product.quoted_table_name}.created_at DESC").limit(2))
  self.scope("discovery", where(:is_discovery => true))

  after_save :delete_extra_master_variant #method to avoid the double variant, due to nested master
  before_save :ensure_uniqueness_of_discovery #method to clean other discoveries


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
      m_var.destroy if m_var.images.empty?
    end
  end

  def variants_attributes=(variants_attrs) #because a product in spree cannot recognize its master variant
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
end