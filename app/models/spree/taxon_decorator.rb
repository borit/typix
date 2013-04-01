
Spree::Taxon.class_eval do
  has_many :prototypes
  
  def get_direct_children
    self.children.where("parent_id = ?",self.id)
  end
  
  def customized_icon
    self.has_descendants? ? "taxons/#{self.name.to_url}B.png" : self.parent.customized_icon #icons are associated with level-two taxon 
  end
  
  def to_breadcrumbs(filArianne= [])
    self.root? ? filArianne : self.parent.to_breadcrumbs(filArianne<<self.name)
    filArianne.reverse.join(' > ')
  end
  
  def applicable_filters
    fs = []
    # fs << ProductFilters.taxons_below(self)
    ## unless it's a root taxon? left open for demo purposes
    case self.name
    when "TV"
      fs << Spree::ProductFilters.techno_filter if Spree::ProductFilters.respond_to?(:techno_filter)
      fs << Spree::ProductFilters.threeD_filter if Spree::ProductFilters.respond_to?(:threeD_filter)
      fs << Spree::ProductFilters.screenSize_filter if Spree::ProductFilters.respond_to?(:screenSize_filter)
      fs << Spree::ProductFilters.internet_filter if Spree::ProductFilters.respond_to?(:internet_filter)
      puts "taxon #{self.name} decorated."
    else
      puts "No decorations for taxon #{self.name}."
    end
    #fs << ProductFilters.price_filter if ProductFilters.respond_to?(:price_filter)
    #fs << ProductFilters.brand_filter if ProductFilters.respond_to?(:brand_filter)
    fs
  end
end