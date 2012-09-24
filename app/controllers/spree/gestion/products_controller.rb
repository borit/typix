module Spree
  module Gestion
    class ProductsController < Spree::Admin::BaseController
      layout '/spree/layouts/gestion/gestion'
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

