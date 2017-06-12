class Feedback < ApplicationRecord
  belongs_to :artwork
  belongs_to :author, class_name: 'User'
  has_many :notifications, dependent: :destroy
  validates :content, presence: :true

  def teacher
    artwork.lecture.course.user
  end

  def student
    artwork.user
  end
end
