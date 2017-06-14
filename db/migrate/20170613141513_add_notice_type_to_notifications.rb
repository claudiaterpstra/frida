class AddNoticeTypeToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :notice_type, :string
  end
end
