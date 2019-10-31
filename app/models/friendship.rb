# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  validate :users_are_not_already_friends

  # validates :confirmed, presence: true

  def users_are_not_already_friends
    errors.add(:user_id, 'Already friends!') if Friendship.where(user_id: friend_id, friend_id: user_id).exists? || Friendship.where(user_id: user_id, friend_id: friend_id).exists?
  end

  def confirm_friend
    friendship = inverse_friendships.find { |friendshp| friendshp.user == self }
    friendship.confirmed = true
    friendship.save
  end
end
