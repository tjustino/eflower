# frozen_string_literal: true

# Store Controller
class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    @products = Product.order(:name)
  end
end
