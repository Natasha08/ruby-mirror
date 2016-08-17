require 'rails_helper'

feature "Login" do
  let!(:user) { create :user }

  scenario "the user logs in" do
    visit root_path
    click_on "Login"
    fill_in "Email", with: 'test_user@test.com'
    fill_in "Password", with: 'test_password'
    click_on "Log in"

    expect(page).to have_content("Signed in successfully")
  end
  scenario "the invalid user attempts login" do
    visit root_path
    click_on "Login"
    fill_in "Email", with: 'invalid_user@test.com'
    fill_in "Password", with: 'invalid_password'
    click_on "Log in"

    expect(page).to have_content("Invalid Email or password")
  end
end
