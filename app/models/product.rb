# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text             not null
#  image_url   :string
#  price       :decimal(8, 2)    not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# Product model
class Product < ApplicationRecord
  has_many :line_items, dependent: :restrict_with_error
  has_many :orders, through: :line_items

  # before_destroy :ensure_not_referenced_by_any_line_item

  validates :name,        presence: true, uniqueness: true
  validates :description, presence: true
  validates :image_url,   allow_blank: true,
                          format:      { with: /\.(gif|jpg|jpeg|png)\Z/i }
  validates :price,       presence:     true,
                          numericality: { greater_than_or_equal_to: 0.01 }

  private

    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      return if line_items.empty?

      errors.add(:base, "Line Items present")
      throw :abort
    end
end
