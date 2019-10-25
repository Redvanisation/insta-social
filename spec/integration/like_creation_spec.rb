require 'rails_helper'
require_relative '../helpers/users_helper_spec'
feature 'Like creation' do
  let(:user) {create(:user)}
  let(:post) {user.posts.build(content: "Yet another post")}

  scenario 'Log in and like a post' do
  login user
        post.save
    visit post_path(post.id)
    expect {
      click_button 'Like'
    }.to change(Like, :count).by(1)
  end


  scenario 'Log in and unlike a post' do
  login user
        post.save
    visit post_path(post.id)
    expect {
      click_button 'Unlike'
    }.to change(Like, :count).by(-1)
  end


end
