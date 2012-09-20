Deface::Override.new(:virtual_path  => "spree/admin/prototypes/_form",
                     :insert_after => "ul#option_types",
                     :original => '33dd920c280ed7504c47e8b9a582ae1a2743e7ef',
                     :text          => "<hr /><h3>Taxon</h3>
                       <%= label :taxon, \"Associated taxon\" %><br />
                       <%@taxon = @prototype.taxon%>
                       <%= text_field :taxon, :permalink %>",
                     :name          => "edit_prototype_taxon")
