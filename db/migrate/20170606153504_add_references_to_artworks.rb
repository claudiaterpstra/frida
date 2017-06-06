class AddReferencesToArtworks < ActiveRecord::Migration[5.0]
  def change
    add_reference :artworks, :user, index: true
  end
end
