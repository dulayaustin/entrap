class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  # before_action :set_category, only: :category
  before_action :set_categories, only: [:index, :category, :show]

  def index
    @products = Product.order("created_at DESC").page(params[:page]).per(6)
    @sub_categories = SubCategory.where(category_id: @category)
  end

  def category
    # @products = @category.products.order("created_at DESC").page(params[:page]).per(6)
    
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
      redirect_to product_path(@product), notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def set_category
      @category = Category.find_by(id: params[:id])
    end

    def set_categories
      @categories = Category.all
    end

    def product_params
      params.require(:product).permit(:name, :price, :description, :sub_category_id)
    end
end
