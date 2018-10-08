# frozen_string_literal: true

require "test_helper"

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_url
    assert_response :success
    assert_select   "h2", "Bonsaï"
    assert_select   "ul.catalog > li", 3
  end
end
