require 'rails_helper'

feature "user creates a comment" do
  let!(:user) { create :user }
  let!(:article) { create :article }

  before do
    user_sign_in
  end
  scenario "the comment is created" do
    visit articles_path
    click_on "Edit"
    fill_in "Commenter", with: 'Newbie'
    fill_in "Body", with: 'A classic, and one of my favorites!'
    expect do
      click_on "Create Comment"
    end.to change { Comment.count }.by 1
  end
end
