class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :notified_by, class_name: 'User'
  belongs_to :feedback
  validates :user_id, :notified_by_id, :feedback_id, presence: true
end
