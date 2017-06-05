class AddCourseToLectures < ActiveRecord::Migration[5.0]
  def change
    add_reference :lectures, :course, foreign_key: true
  end
end
