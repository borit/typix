module Spree
  module Gestion
    module FormHelper
      def jquery_link_to_remove_fields(name, f)
        f.hidden_field(:_destroy) + link_to_function(name, "my_remove_fields(this)")
      end
      def jquery_link_to_add_fields(name, f, association)
        new_object = f.object.class.reflect_on_association(association).klass.new
        op_val = new_object.option_values.build
        op_val.option_type_id = @product.option_types.first.id
        fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
         render(association.to_s.singularize + "_fields", :f => builder)
        end
        fields = h(fields)
        link_to_function(name, "my_add_fields(this, \'#{association}\', \'#{escape_javascript(fields)}\')")

      end
    end
  end
end