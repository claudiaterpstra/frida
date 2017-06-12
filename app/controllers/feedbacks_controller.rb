class FeedbacksController < ApplicationController
  skip_after_action :verify_authorized

  def show
    @artwork = Artwork.find(params[:artwork_id])
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @artwork = Artwork.find(params[:artwork_id])
    @feedback.artwork = @artwork
    if current_user == @feedback.artwork.lecture.course.user
      @feedback.teacher = current_user
    elsif current_user == @feedback.artwork.user
      @feedback.student = current_user
    end
    if @feedback.save
      create_notification(@feedback)
      respond_to do |format|
        format.html { redirect_to studio_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'artworks/show' }
        format.js
      end
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:content)
  end

  def create_notification(feedback)
    if @feedback.student_id == current_user.id
      Notification.create(user_id: @feedback.teacher_id, notified_by_id: current_user.id, feedback_id: feedback.id)
    elsif @feedback.teacher_id == current_user.id
      Notification.create(user_id: @feedback.student_id, notified_by_id: current_user.id, feedback_id: feedback.id)
    end
  end
end
