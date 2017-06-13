class RemoveCourseskuFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :course_sku
  end
end
