module ProductsHelper

  def active_category_menu?(category = nil)
    if defined?(@product)
      @product.category == category
    elsif params[:name].present?
      params[:name] == category.name
    end
  end
end
