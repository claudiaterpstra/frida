class RemoveStudentIdAndTeacherIdFromFeedbacks < ActiveRecord::Migration[5.0]
  def change
    remove_column :feedbacks, :teacher_id
    remove_column :feedbacks, :student_id
  end
end
