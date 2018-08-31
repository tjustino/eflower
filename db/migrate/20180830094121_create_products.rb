# frozen_string_literal: true

# Create products table
class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string  :name,        null: false
      t.text    :description, null: false
      t.string  :image_url
      t.decimal :price, precision: 8, scale: 2, null: false

      t.timestamps
    end
    add_index :products, :name, unique: true
  end
end
