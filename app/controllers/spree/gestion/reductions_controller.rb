module Spree
  module Gestion
    class ReductionsController < Spree::Admin::BaseController
      layout '/spree/layouts/gestion/gestion'

      def index
        @product_and_variants = Spree::Variant.in_promotion.group_by(&:product)
      end

      def destroy
        v = Spree::Variant.find(params[:id])
        success = v.update_attributes(:reduction => 0)
        respond_to do |format|
          format.html {
            if success 
              render :nothing => true, :status => :ok
            else
              render :nothing => true, :status => 500 end}
            end
          end
      def destroy_all
        Spree::Variant.all.each do |variant|
          variant.update_attributes(:reduction => 0)
        end
        redirect_to :action => "index"
      end

      def create
        #Parameters: {"utf8"=>"✓", 
        # "promo"=>"", "reduction"=>{"products"=>"1060500651", "master_variants"=>"", "variants"=>{"1060500651"=>["1013589501", "1013589507"]}}}
        promo = params[:promo]
        params[:reduction][:master_variants].each do |v_id|
          unless (v_id.empty? || v_id.nil?)
            v = Spree::Variant.find(v_id)
            v.update_attributes(:reduction => promo)
          end
        end
        unless params[:reduction][:variants].nil?
          params[:reduction][:variants].each do |key,val|
            val.each do |v_id|
              v = Spree::Variant.find(v_id)
              v.update_attributes(:reduction => promo)
            end
          end
        end
        redirect_to :action => "index"
      end
    end
  end
end