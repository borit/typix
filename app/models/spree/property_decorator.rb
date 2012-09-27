
Spree::Property.class_eval do
 attr_accessible :value_type
 self.scope("get_boolean", where(:value_type => "boolean"))
 self.scope("get_string", where(:value_type => "string"))
 self.scope("get_integer", where(:value_type => "integer"))
 
end