module Spree
  module TypixHelper
    def generate_cart_link

      #text = "#{image_tag("cart.png")}"

      if current_order.nil? or current_order.line_items.empty?
        text = "#{text} 0"
      else
        text = "#{text} #{current_order.item_count}"
      end

      link_to image_tag("cart.png") << text, cart_path, :id => "panier"
    end

    def brand_image(product)  
      ((product.property :brand) =~ (/(Sony|sony)$/i)) ? image_tag("SonyLittle.png", :class=>"brand_img") : image_tag("SamsungLittle.png", :class=>"brand_img")
    end

    def pouce_to_cm(pouce)
      pouce = pouce.to_i
      return (pouce*2.54).to_i
    end

    def bool_to_symbol(value)
      case value
      when "0"
        content_tag(:span, "x", :class=>"x_red")
      when "1"
        content_tag(:span, "v", :class=>"v_green")
      end
    end

    def product_description_linebreak(product)
      raw(product.description.gsub(/(.*?)\r?\n\r?\n/m, '\1</br>'))
    end

    def define_option_unit(product)
      optionType = product.option_types.first.name
      case optionType
      when "tailleEcran"
        return "''"
      when "memory"
        return "go"
      when "dimension"
        return "m"
      else return ""
      end
    end
  end
end
