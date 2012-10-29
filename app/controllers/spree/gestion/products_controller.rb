# encoding: utf-8
module Spree
module Gestion
  class ProductsController < Spree::Admin::BaseController
    layout '/spree/layouts/gestion/gestion'

    before_filter :pathing_link, :only => [:index,:new]
    before_filter :init_selected_taxon, :only => [:index,:new]
    before_filter :load_product, :only =>[:edit,:update,:destroy]
    before_filter :build_property_lists, :only => [:edit]

    def index
      @concerned_taxons = @selected_taxon.children
    end

    def new
      @prototype = Spree::Prototype.find_by_taxon_id(@selected_taxon.id)
      #@product=Spree::Product.find_by_permalink("une-tele")
      @product = Spree::Product.new
      build_properties_from_prototype(@product,@prototype) if @product.product_properties.empty?
      build_variants_from_prototype(@product,@prototype)
      init_image(@product)
    end

    def create
      @prototype = Spree::Prototype.find(params[:product][:prototype_id])
      params[:product][:prototype_id] = nil #in order to avoid doubling of properties.
      @product = Product.new(params[:product])
      @product.taxons << @prototype.taxon      
      @product.option_types << @prototype.option_types
      @product.available_on = Time.now
      if @product.save
        redirect_to gestion_stock_path << "/"<<convert_path(@prototype.taxon.parent.permalink, :ampering), :notice => "Produit enregistré!"
      else
        flash[:error] = "Erreur dans l'encodage du produit."
        build_property_lists
        render :action => 'new'
      end
    end

    def show
      redirect_to :action => "edit"
    end

    def edit

    end
    def update
      back_link = @product.taxons.first.parent.permalink
      if @product.update_attributes(params[:product])
        flash.notice = "Produit correctement mis à jour."
        redirect_to gestion_stock_path << "/"<<convert_path(back_link, :ampering)
      else
        flash[:error] = "Error dans l'encodage du produit."
        render :action => 'edit'
      end
    end
    def destroy
      @product = Spree::Product.find_by_permalink(params[:id])
      back_link = @product.taxons.first.parent.permalink
      if @product.destroy
        flash.notice = "Produit supprimé."
        redirect_to gestion_stock_path << "/"<<convert_path(back_link, :ampering)
      else
        flash[:error] = "La suppression n'a pas eu lieu. Peut-être n'êtes vous pas enregistré?"
        redirect_to gestion_stock_path << "/"<<convert_path(back_link, :ampering)
      end
    end

    def init_selected_taxon
      if(params[:taxon])
        @selected_taxon = Spree::Taxon.find_by_permalink!(@taxon_path) rescue nil
      end
      @selected_taxon ||= Spree::Taxon.find_by_permalink!("produits/ecran")
    end

    def pathing_link
      @taxon_path = convert_path(params[:taxon],:pathing)
    end

    def convert_path(path,direction)
      case direction
      when :ampering
        path.gsub("/", "&")
      when :pathing
        path.gsub("&", "/")
      end
    end

    helper_method :convert_path

    def load_product
      @product = Product.find_by_permalink!(params[:id])
    end

    def build_property_lists
      #@product ||= Spree::Product.find_by_permalink(params[:id]) #if bpl is called by edit, find_by occurs. If called by create, @product is already defined.
      @boolean_properties=[]
      @text_field_properties=[]
      @product.product_properties.each do |pp|
        pp.property.value_type == "boolean" ? @boolean_properties << pp : @text_field_properties << pp
      end
    end

    def init_image(product)
      product.master.images.build
    end
    def build_properties_from_prototype(product,prototype)
      @boolean_properties=[]
      @text_field_properties=[]
      prototype.properties.each do |property|
        product_property = product.product_properties.build
        product_property.property_id = property.id
        property.value_type == "boolean" ? @boolean_properties << product_property : @text_field_properties << product_property
      end
    end
    def build_variants_from_prototype(product,prototype)
    prototype.option_types.each do |ot|
      product.option_types << ot
      var = product.variants.build
      ov = var.option_values.build
      ov.option_type_id = ot.id
    end
  end
end
end
end

