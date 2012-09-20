
Spree::Product.class_eval do
  self.scope("two_last_added", relation.order("#{Spree::Product.quoted_table_name}.created_at DESC").limit(2))
end