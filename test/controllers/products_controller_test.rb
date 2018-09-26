# frozen_string_literal: true

require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:orchidaceae)
  end

  test "should get index" do
    get admin_products_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference("Product.count") do
      post admin_products_url, params: {
        product: {
          name:        SecureRandom.hex,
          description: SecureRandom.hex,
          image_url:   SecureRandom.hex + ".jpg",
          price:       rand(0..500.00).round(2)
        }
      }
    end

    assert_redirected_to admin_products_url
  end

  test "should get edit" do
    get edit_admin_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch admin_product_url(@product), params: {
      product: {
        name:        @product.name,
        description: SecureRandom.hex,
        image_url:   @product.image_url,
        price:       rand(0..500.00).round(2)
      }
    }
    assert_redirected_to admin_products_url
  end

  test "should destroy product" do
    assert_difference("Product.count", -1) do
      delete admin_product_url(@product)
    end

    assert_redirected_to admin_products_url
  end
end
