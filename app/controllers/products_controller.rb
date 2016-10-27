class ProductsController < ApplicationController
  before_action :set_products, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
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
      redirect_to root_url, notice: 'Product was successfully created.'
    else
      redirect_to new_product_path, notice: 'Error'
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url
  end

  private
    def set_products
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :image)
    end
end
