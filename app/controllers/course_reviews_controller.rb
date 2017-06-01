class CourseReviewsController < ApplicationController
  before_action :set_course
  def create
    @course_review = CourseReview.new(review_params, user: current_user , course: @course)
    if @course_review.save
      redirect_to course_path(@course)
    else
      render 'courses/show'
    end
  end

  private
  def set_course
    @course = Course.find(params[:course_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
