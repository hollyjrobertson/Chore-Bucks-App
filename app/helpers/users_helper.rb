module UsersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(user, options = { size: 200 })
    gravatar_id = user.id * 25
    size = options[:size]
    gravatar_url = "https://i.picsum.photos/id/#{gravatar_id}/#{size}/#{size}.jpg"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
