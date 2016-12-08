class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:index, :category, :sub_category, :show]
  skip_before_action :verify_authenticity_token, only: :create

  def index
    @products = Product.includes(:images).recent.page(params[:page]).per(6)
  end

  def category
    @category = Category.find_by(name: params[:name])
    @products = @category.products.includes(:images).recent.page(params[:page]).per(6)
    respond_to do |format|
      format.js
      format.html
    end
  end

  def sub_category
    @sub_category = SubCategory.find_by(name: params[:name])
    @products = @sub_category.products.includes(:images).recent.page(params[:page]).per(6)
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
  end

  def edit
    @category = @product.category
    @sub_category = @product.sub_category
    @sub_categories = @category.sub_categories
  end

  def new
    @product = Product.new

    if params[:category_id]
      category = Category.find_by(id: params[:category_id])
      @sub_categories_collection = category.sub_categories
    elsif params[:sub_category_id]
      sub_category = SubCategory.find_by(id: params[:sub_category_id])
      @sizes_collection = sub_category.sizes
      count = @sizes_collection.count
      count.times { @product.stocks.build }
    end
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      if params[:images]
        params[:images].each { |image| @product.images.create(image: image) }
      end
      # @success = true
      redirect_to product_path(@product), notice: 'Product was successfully created.'
    else
      # @category = @product.category
      # @success = false
      respond_to do |format|
        format.html { render :new }
        format.js { render layout: false }
      end
    end
  end

  def update
    if @product.update(product_params)
      if params[:images]
        params[:images].each { |image| @product.images.create(image: image) }
      end
      render js: "window.location = '#{product_path(@product)}' ", notice: "Product #{@product.name.titleize} was successfully updated."
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
      values = params.require(:product).permit(:name, :price, :description, :sub_category_id, :color, stocks_attributes: [:id, :size_id, :quantity] )
      if values[:category].present?
        values.except![:category]
      end
      values
    end
end
