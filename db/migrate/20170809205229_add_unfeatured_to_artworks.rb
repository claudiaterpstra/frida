class AddUnfeaturedToArtworks < ActiveRecord::Migration[5.0]
  def change
    add_column :artworks, :unfeatured, :boolean
  end
end
