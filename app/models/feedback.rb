class Feedback < ApplicationRecord
  belongs_to :artwork
  belongs_to :student, :class_name => 'User'
  belongs_to :teacher, :class_name => 'User'
end