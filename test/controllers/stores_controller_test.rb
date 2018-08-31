# frozen_string_literal: true

require "test_helper"

class StoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store = stores(:default)
  end

  test "should get index" do
    get admin_stores_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_store_url
    assert_response :success
  end

  test "should create store" do
    assert_difference("Store.count") do
      post admin_stores_url, params: {
        store: {
          name:    SecureRandom.hex,
          address: SecureRandom.hex,
          phone:   SecureRandom.hex
        }
      }
    end

    assert_redirected_to admin_stores_url
  end

  test "should get edit" do
    get edit_admin_store_url(@store)
    assert_response :success
  end

  test "should update store" do
    patch admin_store_url(@store), params: {
      store: {
        name:    @store.name,
        address: @store.address,
        phone:   @store.phone
      }
    }
    assert_redirected_to admin_stores_url
  end

  test "should destroy store" do
    assert_difference("Store.count", -1) do
      delete admin_store_url(@store)
    end

    assert_redirected_to admin_stores_url
  end
end
