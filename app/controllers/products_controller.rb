class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:index, :category, :sub_category, :show]

  def index
    @products = Product.includes(:images).recent.page(params[:page]).per(6)
  end

  def category
    @category = Category.find_by(name: params[:name])
    @products = @category.products.includes(:images).recent.page(params[:page]).per(6)
  end

  def sub_category
    @sub_category = SubCategory.find_by(name: params[:name])
    @products = @sub_category.products.includes(:images).recent.page(params[:page]).per(6)
  end

  def show
  end

  def edit
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    
    if @product.save
      if params[:images]
        params[:images].each { |image| @product.images.create(image: image) }
      end
      redirect_to products_path, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product), notice: "Product #{@product.name.titleize} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: "Product #{@product.name.titleize} was being deleted."
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def set_categories
      @categories = Category.includes(:sub_categories).all
    end

    def product_params
      params.require(:product).permit(:name, :price, :description, :sub_category_id, :color)
    end
end
