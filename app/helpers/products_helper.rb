module ProductsHelper

  def active_category_menu?(category = nil)
    if defined?(@product)
      @product.category == category
    elsif params[:name].present?
      params[:name] == category.name
    end
  end

  # def modify_category_name(cat)
  #   cat_name = cat.downcase.split
  #   cat_name.join("-")
  # end

  def bulleted_description(description)
    details = description.split
    content_tag :ul, class: "description" do    
      details.each do |d|
        concat(content_tag(:li, d))
      end
    end
  end

end
