class AddCourseMaterialsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :course_materials do |t|
      t.references :course, foreign_key: true
      t.references :material, foreign_key: true

      t.timestamps
    end
  end
end
