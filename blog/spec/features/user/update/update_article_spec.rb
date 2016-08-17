require 'rails_helper'

feature "user updates an article" do
  let!(:user) { create :user }
  let!(:article) { create :article }

  before do
    user_sign_in
  end

  scenario "the article is updated" do
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
