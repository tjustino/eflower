# frozen_string_literal: true

require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:admin)
  end

  test "should get index" do
    get admin_users_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post admin_users_url, params: {
        user: {
          email:                 SecureRandom.hex + "@email.com",
          is_admin:              rand(0..1) == 1,
          password:              "p@ssw0rd",
          password_confirmation: "p@ssw0rd"
        }
      }
    end

    assert_redirected_to admin_users_url
  end

  test "should get edit" do
    get edit_admin_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch admin_user_url(@user), params: {
      user: {
        email:                 @user.email,
        is_admin:              @user.is_admin,
        password:              "secret",
        password_confirmation: "secret"
      }
    }
    assert_redirected_to admin_users_url
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete admin_user_url(@user)
    end

    assert_redirected_to admin_users_url
  end
end
