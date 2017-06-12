class FeedbacksController < ApplicationController
  skip_after_action :verify_authorized

  def show
    @artwork = Artwork.find(params[:artwork_id])
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @artwork = Artwork.find(params[:artwork_id])
    @feedback.artwork = @artwork
    @feedback.author = current_user
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
    if feedback.student.id == current_user.id
      Notification.create(user_id: feedback.teacher.id, notified_by_id: current_user.id, feedback_id: feedback.id)
    else
      Notification.create(user_id: feedback.student.id, notified_by_id: current_user.id, feedback_id: feedback.id)
    end
  end
end
