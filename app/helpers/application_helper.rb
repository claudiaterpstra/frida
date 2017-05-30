module ApplicationHelper
  def unique_image_tag(user, options = {})
    if user.facebook_picture_url
      image_tag(user.facebook_picture_url, options)
    elsif user.photo && user.photo.path
      cl_image_tag(user.photo.path, options)
    else
      image_tag("https://placehold.it/32x32", options)
    end
  end
end
