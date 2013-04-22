Spree::ProductsController.class_eval do
  before_filter :load_properties, :only => :show
  before_filter :setProductTaxon, :only => :show
  
  def load_properties
      @integer_properties = getSpecificPropertiesValues("integer")
		  @string_properties = getSpecificPropertiesValues("string")
		  @boolean_properties = getSpecificPropertiesValues("boolean")
  end
  
  def getSpecificPropertiesValues(type)
    return Spree::ProductProperty.includes(:property).where("#{Spree::ProductProperty.quoted_table_name}.product_id = ? AND #{Spree::Property.quoted_table_name}.value_type =?",@product.id, type)
  end
  
  def setProductTaxon
    @taxon = @product.taxons.first #set default taxon
  end
end