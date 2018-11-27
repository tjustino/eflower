# frozen_string_literal: true

require "test_helper"

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_url
    assert_response :success
    assert_select ".items > .item:first-child > .content > .header", "Bonsaï"
    assert_select ".items > .item", 3
  end
end
