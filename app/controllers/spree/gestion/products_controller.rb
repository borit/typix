module Spree
  module Gestion
    class ProductsController < Spree::Admin::BaseController
      layout '/spree/layouts/gestion/gestion'
      before_filter :init_selected_taxon
      def index
       @products = @selected_taxon.products.active 
      end
      def new
        
      end
      def edit
        render :nothing => true
      end
      def init_selected_taxon
        if(params[:taxon])
        @selected_taxon = Spree::Taxon.find_by_permalink!("produits/"<<params[:taxon]) rescue nil
      end
        @selected_taxon ||= Spree::Taxon.find_by_permalink!("produits/ecran")
      end
    end
  end
end

