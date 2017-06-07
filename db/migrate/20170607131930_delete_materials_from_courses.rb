class DeleteMaterialsFromCourses < ActiveRecord::Migration[5.0]
  def change
    drop_table :course_materials
    drop_table :materials
  end
end
