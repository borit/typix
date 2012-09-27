Deface::Override.new(:virtual_path  => "spree/admin/properties/_form",
                     :insert_before => "code[erb-loud]:contains('field_container :presentation')",
                     :text          => "<%=f.field_container :value_type do %>
                         <%= f.label :value_type, \"Type\" %> <br />
                         <%= if @property.value_type.nil?
                           f.select :value_type, ['boolean','integer','string'], :selected =>\"string\" 
                           else f.select :value_type, ['boolean','integer','string'], :selected => @property.value_type end%>
                         <%= f.error_message_on :value_type %>
                       <% end %>",
                     :name          => "edit_property_type")
