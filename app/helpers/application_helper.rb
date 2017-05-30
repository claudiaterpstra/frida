module ApplicationHelper
  def unique_image_tag(user, options = {})
    if false #user.picture_url when merged with Facebook authentication
      image_tag(user.picture_url, options)
    elsif user.photo && user.photo.path
      cl_image_tag(user.photo.path, options)
    else
      image_tag("https://placehold.it/32x32", options)
    end
  end
end
