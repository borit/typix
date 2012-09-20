
Spree::Admin::PrototypesController.class_eval do
  private
  def set_habtm_associations
    @prototype.property_ids = params[:property][:id] if params[:property]
    @prototype.option_type_ids = params[:option_type][:id] if params[:option_type]
    puts "AAAAAAaAAAaAAAAAAAAAA"
  end
end



