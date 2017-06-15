module ApplicationHelper
  def unique_image_tag(user, options = {})
    if user.facebook_picture_url
      image_tag(user.facebook_picture_url, options)
    elsif user.photo && user.photo.path
      cl_image_tag(user.photo.path, options)
    else
      image_tag("http://res.cloudinary.com/rebekah/image/upload/v1497521007/frida-placeholder_lmvicp.jpg", options)
    end
  end
end
