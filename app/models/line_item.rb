# frozen_string_literal: true

# Cart model
class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
end
