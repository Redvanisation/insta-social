# frozen_string_literal: true

module UsersHelper

  def gravatar_for(user, options = { size: 60 })
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{user.avatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: 'gravatar')
  end

end
