class AddBiodataToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :biodata, :text
  end
end
