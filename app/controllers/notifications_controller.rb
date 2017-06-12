class NotificationsController < ApplicationController
  skip_after_action :verify_authorized
  before_action :set_notification, only: :link_through
  def link_through
    @notification.update(read: true)
    if current_user.teacher
      redirect_to give_feedback_path(@notification.feedback, artwork: @notification.feedback.artwork.id)
    else
      redirect_to studio_path(@notification.feedback, artwork: @notification.feedback.artwork.id)
    end
  end

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end
end
