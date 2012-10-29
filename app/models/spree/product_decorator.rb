
Spree::Product.class_eval do

  alias :original_var_attr= :variants_attributes=


  self.scope("two_last_added", relation.order("#{Spree::Product.quoted_table_name}.created_at DESC").limit(2))
  after_save :delete_extra_master_variant #method to avoid the double variant, due to nested master

  def delete_extra_master_variant
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