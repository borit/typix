module Spree
  class HomeController < BaseController
    helper 'spree/products'
    respond_to :html


    def index
      @searcher = Spree::Config.searcher_class.new(params)
      #@products = @searcher.retrieve_products
      @discovery = Spree::Product.discovery.first
      @novelties = Product.in_taxons("produits").two_last_added
      #TO DO: Add promo
      respond_with(@novelties)
    end
  end
end
