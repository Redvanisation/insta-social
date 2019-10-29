# frozen_string_literal: true

module UsersHelper
  def gravatar_for(user, options = { size: 80 })
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{user.avatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: 'gravatar')
  end

  def make_gravatar_id(user)
    Digest::MD5.hexdigest(user.email.downcase)
  end

  def friends
    friends_array = friendships.map { |friendship| friendship.friend if friendship.confirmed }
    inverse_array = inverse_friendships.map { |friendship| friendship.user if friendship.confirmed }
    friends_array << inverse_array
    friends_array.compact
  end

  # Users who have yet to confirme friend requests
  def pending_friends
    friendships.map { |friendship| friendship.friend unless friendship.confirmed }.compact
  end

  # Users who have requested to be friends
  def friend_requests
    inverse_friendships.map { |friendship| friendship.user unless friendship.confirmed }.compact
  end

  def confirm_friend(user)
    friendship = inverse_friendships.find { |friendshp| friendshp.user == user }
    friendship.confirmed = true
    friendship.save
  end

  def friend?(user)
    friends.include?(user)
  end
end
