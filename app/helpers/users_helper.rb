module UsersHelper
  
  def gravatar_for(user, options = { size: 80 })
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{user.avatar_id}?s=#{size}"
    image_tag( gravatar_url, alt: user.name, class: "gravatar")
  end

  def make_gravatar_id(user)
    Digest::MD5::hexdigest(user.email.downcase)
  end

end
