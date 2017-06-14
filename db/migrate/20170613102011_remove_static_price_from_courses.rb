class RemoveStaticPriceFromCourses < ActiveRecord::Migration[5.0]
  def change
    remove_column :courses, :price
  end
end
