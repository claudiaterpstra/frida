class AddUserReferencesToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :course_reviews, :user, index: true
  end
end
