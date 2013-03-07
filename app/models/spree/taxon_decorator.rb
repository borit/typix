
Spree::Taxon.class_eval do
  has_many :prototypes
  def applicable_filters
    fs = []
    # fs << ProductFilters.taxons_below(self)
    ## unless it's a root taxon? left open for demo purposes
    case self.name
    when "TV"
      fs << Spree::ProductFilters.techno_filter if Spree::ProductFilters.respond_to?(:techno_filter)
      fs << Spree::ProductFilters.threeD_filter if Spree::ProductFilters.respond_to?(:three_d_filter)
      fs << Spree::ProductFilters.screenSize_filter if Spree::ProductFilters.respond_to?(:screenSize_filter)
      puts "taxon #{self.name} decorated."
    else
      puts "No decorations for taxon #{self.name}."
    end
    #fs << ProductFilters.price_filter if ProductFilters.respond_to?(:price_filter)
    #fs << ProductFilters.brand_filter if ProductFilters.respond_to?(:brand_filter)
    fs
  end
end