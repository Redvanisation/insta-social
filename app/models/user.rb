# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'

  def gravatar_for( options = { size: 80 })
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{self.avatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: self.name, class: 'gravatar')
  end

  def make_gravatar_id
    Digest::MD5.hexdigest(self.email.downcase)
  end

  def friends
    inverse_array = friendships.map { |friendship| friendship.friend if friendship.confirmed } + inverse_friendships.map { |friendship| friendship.user if friendship.confirmed }
    inverse_array.compact
  end

  # Users who have yet to confirme friend requests
  def sent_requests
    friendships.map { |friendship| friendship.friend unless friendship.confirmed }.compact
  end

  # Users who have requested to be friends
  def received_requests
    inverse_friendships.map { |friendship| friendship.user unless friendship.confirmed }.compact
  end

  def confirm_friend
    friendship = inverse_friendships.find { |friendshp| friendshp.user == self }
    friendship.confirmed = true
    friendship.save
  end

  def friend?(user)
    friends.include?(user)
  end

  def notifications_count
    self.received_requests.count if self.received_requests.any?
  end
end
