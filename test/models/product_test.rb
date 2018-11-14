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

require "test_helper"

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test "product attributes must not be empty (except image_url)" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:name].any?
    assert product.errors[:description].any?
    assert product.errors[:image_url].empty? # allow_blank: true
    assert product.errors[:price].any?
  end

  test "product price must be positive" do
    product = new_product

    product.price = -1
    assert product.invalid?
    assert_equal [
      I18n.t("activerecord.errors.messages.greater_than_or_equal_to",
             count: 0.01)
    ], product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal [
      I18n.t("activerecord.errors.messages.greater_than_or_equal_to",
             count: 0.01)
    ], product.errors[:price]

    product.price = 1
    assert product.valid?
  end

  test "image URL" do
    ok = %w[image.gif image.jpg image.jpeg image.png https:://url.com/image.jpg]
    ko = %w[image.pdf image.gifjpeg https:://url.com/image.jpg/more]

    ok.each do |image_url|
      assert new_product(image_url).valid?, "#{image_url} should be valid"
    end

    ko.each do |image_url|
      assert new_product(image_url).invalid?, "#{image_url} shouldn't be valid"
    end
  end

  test "product is not valid with name already given" do
    product = Product.new(name:        products(:orchidaceae).name,
                          description: "Vivamus hendrerit nisl eu fringilla",
                          image_url:   "image.jpg",
                          price:       1)

    assert product.invalid?
    assert_equal [
      I18n.t("activerecord.errors.messages.taken")
    ], product.errors[:name]
  end

  private ######################################################################

    def new_product(image_url = nil)
      Product.new(name:        "My awesome product",
                  description: "Lorem ipsum dolor sit amet, amet elit.",
                  image_url:   image_url,
                  price:       rand(1..99).round(2))
    end
end
