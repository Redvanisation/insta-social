# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { create(:user) }
  let(:post) { user.posts.build(content: 'Post number one') }
  let(:like) { Like.new }
  it 'Checks if the Like model is present' do
    post.save
    like.save
    like.post_id = post.id
    like.user_id = user.id
    expect(like).to be_valid
  end
  it 'Checks if the like belongs to a post' do
    post.save
    like.post_id = post.id
    like.user_id = user.id
    like.save
    expect(like.post).to eq(post)
  end

  it 'Checks if the like has a user' do
    post.save
    like.post_id = post.id
    like.user_id = user.id
    like.save
    expect(like.user).to eq(user)
  end
end
