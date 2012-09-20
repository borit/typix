
Spree::Admin::PrototypesController.class_eval do
  after_filter :set_taxon_association, :only => [:create, :update]
  private
  def set_taxon_association
    if !params[:taxon][:permalink].empty?
      begin
       associated_taxon = Spree::Taxon.find_by_permalink!(params[:taxon][:permalink])
       @prototype.taxon_id = associated_taxon.id
       @prototype.save!
       rescue 
         flash[:error] = "Taxon path was not correct."
         false
        end
     else 
       @prototype.taxon_id = ""
       @prototype.save!
    end
    
  end
end