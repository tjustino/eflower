# frozen_string_literal: true

require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:admin)
  end

  test "visiting the index" do
    visit admin_users_url
    assert_selector "h1", text: "Liste des utilisateurs"
  end

  test "creating a User" do
    visit admin_users_url
    click_on "Nouvel utilisateur"

    fill_in "user_email",                 with: SecureRandom.hex + "@email.com"
    fill_in "user_password",              with: "p@ssw0rd"
    fill_in "user_password_confirmation", with: "p@ssw0rd"
    rand(0..1) == 1 ? check("user_is_admin") : uncheck("user_is_admin")
    click_on "Create User"

    assert_text "User was successfully created"
    # click_on "Back"
  end

  test "updating a User" do
    visit admin_users_url
    click_on "Edition", match: :first

    fill_in "user_email",                 with: @user.email
    fill_in "user_password",              with: "secret"
    fill_in "user_password_confirmation", with: "secret"
    rand(0..1) == 1 ? check("user_is_admin") : uncheck("user_is_admin")
    click_on "Update User"

    assert_text "User was successfully updated"
    # click_on "Back"
  end

  test "destroying a User" do
    visit admin_users_url
    page.accept_confirm do
      click_on "Suppression", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
