class CourseReviewsController < ApplicationController
  before_action :set_course
  skip_after_action :verify_authorized, only: [:create]
  def create
    @course_review = CourseReview.new(course_review_params)
    @course_review.user = current_user
    @course_review.course = @course
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

  def course_review_params
    params.require(:course_review).permit(:content, :rating)
  end
end
