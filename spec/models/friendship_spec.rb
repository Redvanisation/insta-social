# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:user) { create(:user) }
  let(:friend) { create(:user) }
  let(:friend2) { create(:user) }
  let(:friendship) { Friendship.new }
  let(:friendship2) { Friendship.new }

  context 'Presence and validation' do
    it "Checks if friendship model's presence" do
      friendship.save
      expect(friendship).not_to be_valid
    end

    it 'Checks if friendship model is valid' do
      friendship.user_id = user.id
      friendship.friend_id = friend.id
      expect(friendship).to be_valid
    end
  end

  context 'Associations' do
    it 'Checks if user has many friendships' do
      friendship.user_id = user.id
      friendship.friend_id = friend.id
      friendship.confirmed = true
      friendship.save

      friendship2.user_id = user.id
      friendship2.friend_id = friend2.id
      friendship2.confirmed = true
      friendship2.save

      expect(friendship.user).to eq(user)
      expect(friendship2.user).to eq(user)
      expect(user.friendships).to include(friendship)
      expect(user.friendships).to include(friendship2)
    end
  end
end
