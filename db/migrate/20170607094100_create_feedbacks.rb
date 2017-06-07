class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.string :content
      t.references :artwork, foreign_key: true
      t.references :student
      t.references :teacher

      t.timestamps
    end
  end
end
