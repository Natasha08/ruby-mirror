require 'rails_helper'

feature "The User Registers" do

  scenario "by successfully signing up" do
    visit root_path
    click_on "Login"
    click_on "Sign up"
    fill_in "Email", with: 'test_user2@test.com'
    fill_in "Password", with: 'test_password2'
    fill_in "Password confirmation", with: 'test_password2'
    click_on "Sign up"

    expect(page).to have_content("You have signed up successfully")
  end

  let!(:user) { create :user }

  scenario "incorrectly with existing user info" do
    visit root_path
    click_on "Login"
    click_on "Sign up"
    fill_in "Email", with: 'test_user@test.com'
    fill_in "Password", with: 'test_password'
    fill_in "Password confirmation", with: 'test_password'
    click_on "Sign up"
    
    expect(page).to have_content("Email has already been taken")
  end
end
