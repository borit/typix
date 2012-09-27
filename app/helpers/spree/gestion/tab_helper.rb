module Spree
  module Gestion
    module TabHelper
      #this helper provides tab generation for admin ressources
      def tab_build(*args)
        options = {:label => args.first.to_s}
        if args.last.is_a?(Hash)
          options = options.merge(args.pop)
        end
        options[:route] ||=  "gestion_#{args.first}"

        destination_url = options[:url] || spree.send("#{options[:route]}_path")

        titleized_label = t(options[:label], :default => options[:label]).titleize

        link = link_to(titleized_label, destination_url)

        css_classes = []

        selected = if options[:match_path]
          request.fullpath.starts_with?("#{root_path}gestion#{options[:match_path]}")
        else
          args.include?(controller.controller_name.to_sym)
        end
        css_classes << 'selected' if selected

        if options[:css_class]
          css_classes << options[:css_class]
        end
        content_tag('li', link, :class => css_classes.join(' '))
      end
    end
  end
end

