class AddFeaturedToArtworks < ActiveRecord::Migration[5.0]
  def change
    add_column :artworks, :featured, :boolean
  end
end
