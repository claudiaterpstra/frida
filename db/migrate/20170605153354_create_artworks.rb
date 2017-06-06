class CreateArtworks < ActiveRecord::Migration[5.0]
  def change
    create_table :artworks do |t|
      t.string :message
      t.references :lecture, foreign_key: true
      t.timestamps
    end
  end
end
