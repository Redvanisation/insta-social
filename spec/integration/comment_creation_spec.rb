require 'rails_helper'
require_relative '../helpers/users_helper_spec'
feature 'Comment creation' do
  let(:user) { create(:user) }
  let(:post) { user.posts.build(content: 'post number one') }
  let(:comment) { post.comments.build(body: 'Comment for post 1') }

  scenario 'Logged in user can create a comment on a post' do
    login user
    post.save
    visit post_path(post.id)
    fill_in 'Body', with: comment.body

    expect do
      click_button 'Comment'
    end.to change(Comment, :count).by(1)
  end
end
