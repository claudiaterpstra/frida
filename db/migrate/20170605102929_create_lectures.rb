class CreateLectures < ActiveRecord::Migration[5.0]
  def change
    create_table :lectures do |t|
      t.string :title
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end
