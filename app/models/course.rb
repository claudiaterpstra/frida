class Course < ApplicationRecord
  belongs_to :user
  has_many :participations, dependent: :destroy

  has_many :participants, through: :participations, source: :user
  has_many :course_reviews, dependent: :destroy

  has_attachment :photo
  validates :name, presence: :true
  validates :category, presence: :true
  validates :description, presence: :true
  validates :price, presence: :true

  def average_rating
    if course_reviews.count > 0
      rating_array = []
      course_reviews.each do |review|
        rating_array << review.rating
      end
      total = rating_array.inject(:+)
      average_rating = total / course_reviews.count
    else
      average_rating = 0
    end
  end
end
