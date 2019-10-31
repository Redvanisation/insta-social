# frozen_string_literal: true

require 'rails_helper'

feature 'Posts creation' do
  let(:user) { create(:user) }
  let(:post) { build(:post) }

  scenario 'Logged in user can create a post' do
    login user
    visit new_post_path
    fill_in 'Content', with: post.content
    post.user_id = user.id

    expect do
      click_button('Publish').to change(Post, :count).by(1)
    end
  end

  scenario "Non logged in user can't create a post" do
    visit new_post_path
    expect(page).to have_content('Log in')
  end
end
