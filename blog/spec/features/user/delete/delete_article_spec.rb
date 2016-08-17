require 'rails_helper'

feature "user deletes an article" do
  let!(:user) { create :user }
  let!(:article) { create :article }

  before do
    user_sign_in
  end
  scenario "the article is deleted" do
    visit articles_path
    within "tr", text:article.title do
      click_on "Delete"
    end
    expect(Article.find_by_id(article.id)).to be_nil
  end
end
