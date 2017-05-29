class Course < ApplicationRecord
  belongs_to :user
  has_many :participations
  validates :name, presence: :true
  validates :category, presence: :true
  validates :description, presence: :true
  validates :price, presence: :true
end
