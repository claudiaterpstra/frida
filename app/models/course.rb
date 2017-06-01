class Course < ApplicationRecord
  belongs_to :user
  has_many :participations, dependent: :destroy
  has_attachment :photo
  validates :name, presence: :true
  validates :category, presence: :true
  validates :description, presence: :true
  validates :price, presence: :true
end
