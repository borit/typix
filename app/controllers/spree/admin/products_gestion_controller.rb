module Spree
  module Admin
    class ProductsGestionController < Spree::Admin::BaseController
      layout '/spree/layouts/admin/gestion'
      before_filter :init_selected_product
      def index
        @products = Product.all
      end
      def edit
        render :nothing => true
      end
      def init_selected_product
        @selected_product |= "tv"
      end
    end
  end
end

