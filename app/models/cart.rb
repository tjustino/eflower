# frozen_string_literal: true

# Cart model
class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
end
