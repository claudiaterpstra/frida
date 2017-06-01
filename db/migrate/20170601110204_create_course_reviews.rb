class CreateCourseReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :course_reviews do |t|
      t.string :content
      t.integer :rating
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
