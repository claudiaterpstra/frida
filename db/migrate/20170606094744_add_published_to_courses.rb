class AddPublishedToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :published, :boolean
  end
end
