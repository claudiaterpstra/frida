class Artwork < ApplicationRecord
  belongs_to :lecture
  belongs_to :user
  has_many :feedbacks, dependent: :destroy
  has_one :course, through: :lecture
  has_many :pins
  has_attachment :photo
end
