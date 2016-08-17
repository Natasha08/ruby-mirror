def user_sign_in
    visit root_path
    click_on "Login"
    fill_in "Email", with: 'test_user@test.com'
    fill_in "Password", with: 'test_password'
    click_on "Log in"
    click_on "My Blog"
end
