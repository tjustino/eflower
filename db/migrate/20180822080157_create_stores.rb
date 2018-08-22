# frozen_string_literal: true

# Create stores table
class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name,    null: false
      t.text   :address, null: false
      t.string :phone,   null: false

      t.timestamps
    end
    add_index :stores, :name, unique: true
  end
end
