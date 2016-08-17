require 'rails_helper'

describe CommentsController do
  context "POST #create" do
    it "creates a comment with status 302" do
      article = create(:article)
      comment = create(:comment, article_id: article[:id])
      post :create, params: {article_id: article[:id], comment: {comment: comment}}

      expect(response).to have_http_status(302)
    end
  end
end
