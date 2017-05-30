class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :courses
  has_many :participations
  has_attachment :photo
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def unique_picture_url
    if self.picture_url
      return self.picture_url
    elsif self.photo && self.photo.url
      return self.photo.url
    else
      "https://placehold.it/32x32"
    end
  end
end
