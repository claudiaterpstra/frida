class ParticipationsController < ApplicationController
  before_action :set_course
  skip_after_action :verify_authorized, only: [:create]

  # before_action :set_user
  def create
    Participation.create!(user: current_user , course: @course)
    redirect_to course_path(@course)
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end
end
