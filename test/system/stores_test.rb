# frozen_string_literal: true

require "application_system_test_case"

class StoresTest < ApplicationSystemTestCase
  setup do
    @store = stores(:default)
  end

  test "visiting the index" do
    visit admin_stores_url
    assert_selector "h1", text: "Liste des magasins"
  end

  test "creating a Store" do
    visit admin_stores_url
    click_on "Nouveau magasin"

    fill_in "store_name",    with: SecureRandom.hex
    fill_in "store_address", with: SecureRandom.hex
    fill_in "store_phone",   with: SecureRandom.hex
    click_on "Create Store"

    assert_text "Store was successfully created"
    # click_on "Back"
  end

  test "updating a Store" do
    visit admin_stores_url
    click_on "Edit", match: :first

    fill_in "store_name",    with: @store.name
    fill_in "store_address", with: @store.address
    fill_in "store_phone",   with: @store.phone
    click_on "Update Store"

    assert_text "Store was successfully updated"
    # click_on "Back"
  end

  test "destroying a Store" do
    visit admin_stores_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Store was successfully destroyed"
  end
end
