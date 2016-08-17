require 'rails_helper'

feature "user creates an article" do
  let!(:user) { create :user }

  before do
    user_sign_in
  end
  scenario "the article is created" do
    click_on "New article"
    fill_in "Title", with: 'A Tale of Two Cities'
    fill_in "Text", with: 'It was the best of times, it was the worst of times...'
    expect do
      click_on "Create Article"
    end.to change { Article.count }.by 1
  end
end
