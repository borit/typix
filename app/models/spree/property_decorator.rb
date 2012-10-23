
Spree::Property.class_eval do
 attr_accessible :value_type
 self.scope("getBoolean", where(:value_type => "boolean"))
 self.scope("getString", where(:value_type => "string"))
 self.scope("getInteger", where(:value_type => "integer"))
 
end