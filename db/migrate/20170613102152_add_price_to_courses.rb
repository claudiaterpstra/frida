class AddPriceToCourses < ActiveRecord::Migration[5.0]
  def change
    add_monetize :courses, :price, currency: { present: false }
  end
end
