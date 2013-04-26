module Spree
  module Gestion
    module BaseHelper
def product_picking(name, value)
  products = Product.with_ids(value.split(','))
  product_names = products.inject({}){|memo,item| memo[item.id] = item.name; memo}
  product_rules = products.collect{ |p| { :id => p.id, :name => p.name } }
  %(<input type="text" name="#{name}" value="#{value}" id="my_search_field" data-names='#{product_names.to_json}' data-pre='#{product_rules.to_json}'/>).html_safe
end
end
end
end