class CourseReview < ApplicationRecord
  belongs_to :course
  belongs_to :user
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5], allow_nil: false }
  validates_numericality_of :rating, only_integer: true
end
