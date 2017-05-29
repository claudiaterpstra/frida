class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :rating
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
