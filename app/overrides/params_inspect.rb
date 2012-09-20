Deface::Override.new(:virtual_path  => "spree/layouts/admin",
                     :insert_after => "div#header",
                     :text          => "<p style=\"color : #f00;\"> current controller:
                 		<%= @current_controller%>, params <%= params%>, </p>",
                     :original => 'd2181fc9a59baecc2de8bdf9f40161af6da78435',
                     :name          => "params_inspect")