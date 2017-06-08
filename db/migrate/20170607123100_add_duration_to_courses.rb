class AddDurationToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :duration, :integer
  end
end
