class Course < ApplicationRecord
  belongs_to :user

  has_many :course_materials
  has_many :materials, through: :course_materials
  accepts_nested_attributes_for :materials


  has_many :participations, dependent: :destroy
  has_many :participants, through: :participations, source: :user
  has_many :course_reviews, dependent: :destroy

  has_attachment :photo

  validates :name, presence: :true
  validates :category, presence: :true
  validates :description, presence: :true
  validates :price, presence: :true
end
