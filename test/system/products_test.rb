# frozen_string_literal: true

require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:bonsai)
  end

  test "visiting the index" do
    visit admin_products_url
    assert_selector "h1", text: "Liste des produits"
  end

  test "creating a Product" do
    visit admin_products_url
    click_on "Nouveau produit"

    fill_in "product_name",        with: SecureRandom.hex
    fill_in "product_description", with: SecureRandom.hex
    fill_in "product_image_url",   with: SecureRandom.hex
    fill_in "product_price",       with: rand(0..500.00).round(2)
    click_on "Create Product"

    assert_text "Product was successfully created"
    # click_on "Back"
  end

  test "updating a Product" do
    visit admin_products_url
    click_on "Edit", match: :first

    fill_in "product_name",        with: SecureRandom.hex
    fill_in "product_description", with: SecureRandom.hex
    fill_in "product_image_url",   with: SecureRandom.hex
    fill_in "product_price",       with: rand(0..500.00).round(2)
    click_on "Update Product"

    assert_text "Product was successfully updated"
    # click_on "Back"
  end

  test "destroying a Product" do
    visit admin_products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end
