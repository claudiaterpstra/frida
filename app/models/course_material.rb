class CourseMaterial < ApplicationRecord
  belongs_to :course
  belongs_to :material
end
