# frozen_string_literal: true

# Line Items Controller
class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: %i[create]
  before_action :set_line_item, only: %i[edit update destroy]

  # GET /line_items
  def index
    @line_items = LineItem.all
  end

  # # GET /line_items/1
  # def show; end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit; end

  # POST /line_items
  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)

    if @line_item.save
      redirect_to @line_item.cart
    else
      render :new
    end
  end

  # PATCH/PUT /line_items/1
  def update
    if @line_item.update(line_item_params)
      redirect_to @line_item, notice: "Line item was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /line_items/1
  def destroy
    @line_item.destroy
    redirect_to line_items_url, notice: "Line item was successfully destroyed."
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from internet, only allow the white list through
    def line_item_params
      params.require(:line_item).permit(:product_id)
    end
end
