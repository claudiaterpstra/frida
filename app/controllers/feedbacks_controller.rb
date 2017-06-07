class FeedbacksController < ApplicationController
  skip_after_action :verify_authorized

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.artwork = Artwork.find(params[:artwork_id])
    @feedback.student = @feedback.artwork.user
    @feedback.teacher = @feedback.artwork.lecture.course.user
    if @feedback.save
      redirect_to studio_path
    else render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:content)
  end
end
