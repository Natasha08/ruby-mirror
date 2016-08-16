# user clicks on login button

#user fills out the form

#user presses submit, and gets a 302 to (whatever page the user is set to navigate to after logging in)

#user creates a new session
require 'rails_helper'

feature "Login" do
  scenario "the user logs in" do
    visit root_path
    click_on "Login"
    fill_in "Email", with: 'test_user@test.com'
    fill_in "Password", with: 'test_password'
    click_on "Log in"
      # expect(page).to have_selector(".header .username", :text => "jdoe")
  end
end
