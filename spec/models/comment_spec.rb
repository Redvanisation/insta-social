# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user) }
  let(:post) { user.posts.build(content: 'Post number one') }

  let(:comment) { post.comments.build(body: 'Comment body', user_id: post.user_id) }

  it 'Checks if the model is present' do
    post.save
    comment.save
    expect(comment).to be_valid
  end

  it 'Checks if the comment has a valid body' do
    comment.body = ' '
    expect(comment).not_to be_valid
  end

  it 'Checks if the comment has an existing user' do
    comment.user = nil
    expect(comment).not_to be_valid
  end

  it 'checks if the comment has an existing post' do
    comment.post = nil
    expect(comment).not_to be_valid
  end
end
