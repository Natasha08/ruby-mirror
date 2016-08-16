require 'rails_helper'

feature "user updates an article" do
  let!(:user) { create :user }
  let!(:article) { create :article }

  before do
    visit root_path
    click_on "Login"
    fill_in "Email", with: 'test_user@test.com'
    fill_in "Password", with: 'test_password'
    click_on "Log in"
  end
  scenario "the article is updated" do
    click_on "My Blog"
    within "tr", text:article.title do
    click_on "Edit"
    end
    click_on "Edit"
    fill_in "Title", with: 'A Man for All Seasons'
    fill_in "Text", with: 'Every man has his price...'

    click_on "Update Article"
    expect(page).to have_content 'Every man has his price...'
  end
end
