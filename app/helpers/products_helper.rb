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
end
