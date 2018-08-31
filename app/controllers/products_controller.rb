# frozen_string_literal: true

# Products Controller
class ProductsController < ApplicationController
  before_action :set_product, only: %i[edit update destroy]

  # GET /products
  def index
    @products = Product.all
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit; end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_url,
                  notice: "Product was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      redirect_to admin_products_url,
                  notice: "Product was successfully updated."
    else
      format.html { render :edit }
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to admin_products_url,
                notice: "Product was successfully destroyed."
  end

  private ######################################################################

    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from internet, only allow the white list through
    def product_params
      params.require(:product).permit(:name, :description, :image_url, :price)
    end
end
