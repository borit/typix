Spree::Core::Search::Base.class_eval do

  def add_search_scopes(base_scope)
    search.each do |name, scope_attribute|
      scope_name = name.to_sym
      if base_scope.respond_to?(:search_scopes) && base_scope.search_scopes.include?(scope_name.to_sym)
        puts "truc42 haha name #{name}"
        base_scope = base_scope.send(scope_name, *scope_attribute)
      else
        puts "truc42 autre name #{name}"
        base_scope = base_scope.merge(Spree::Product.search({scope_name => scope_attribute}).result)
      end
    end if search
    base_scope
  end
end