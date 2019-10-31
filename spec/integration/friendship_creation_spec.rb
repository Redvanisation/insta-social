# frozen_string_literal: true

require 'rails_helper'

feature 'Friendship creation' do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }

  scenario 'Sending a friend request and incrementing the notifications' do
    login user
    click_on 'Logout'
    login user2
    expect do
      click_button 'Add as a friend'
    end.to change(Friendship, :count).by(1)
    expect(user.notifications_count).to be(1)
  end

  scenario 'Accept friendship request' do
    login user
    click_on 'Logout'
    login user2
    click_on 'Add as a friend'
    click_on 'Logout'
    login user
    visit user_path(user)
    click_button 'Accept'
    expect(Friendship.last.confirmed).to be(true)
  end
end
