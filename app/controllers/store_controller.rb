# frozen_string_literal: true

# Store Controller
class StoreController < ApplicationController
  def index
    @products = Product.order(:name)
  end
end
