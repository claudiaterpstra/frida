class AddAuthorIdToFeedbacks < ActiveRecord::Migration[5.0]
  def change
    add_reference :feedbacks, :author, index: true
  end
end
