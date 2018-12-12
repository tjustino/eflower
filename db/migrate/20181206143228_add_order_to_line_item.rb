# frozen_string_literal: true

# Add order to line items table
class AddOrderToLineItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :line_items, :order, foreign_key: true
  end
end
