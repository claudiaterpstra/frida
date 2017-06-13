class CreatePins < ActiveRecord::Migration[5.0]
  def change
    create_table :pins do |t|
      t.integer :left
      t.integer :top
      t.integer :numero
      t.references  :artwork, foreign_key: true, index: true

      t.timestamps
    end
  end
end
