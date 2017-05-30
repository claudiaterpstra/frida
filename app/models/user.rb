class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :courses
  has_many :participations
  has_attachment :photo
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
