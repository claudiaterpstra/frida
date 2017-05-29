class ParticipationsController < ApplicationController

  def create
    Participation.create!(user_id: current_user.id , course_id: @course)
    redirect_to course_path(@course)
  end
end
