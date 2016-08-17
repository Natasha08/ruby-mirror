require 'rails_helper'

feature "user deletes a comment" do
  let!(:user) { create :user }
  let!(:article) { create :article }
  let!(:comment) { create :comment }

  before do
    user_sign_in
  end
  scenario "the comment is deleted" do
    visit articles_path
    within "tr", text:article.title do
      click_on "Edit"
    end
    click_on "Delete Comment"
    expect(Comment.find_by_id(article.id)).to be_nil
  end
end
