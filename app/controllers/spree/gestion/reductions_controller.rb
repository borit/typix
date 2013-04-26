module Spree
  module Gestion
    class ReductionsController < Spree::Admin::BaseController
      layout '/spree/layouts/gestion/gestion'

      def index
        @reductions = Spree::Variant.in_promotion
        
      end

    end
  end
end