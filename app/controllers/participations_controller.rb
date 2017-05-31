class ParticipationsController < ApplicationController

  def create
    Participation.create!(user_id: current_user.id, course_id: @course)
    redirect_to user_path(current_user)
  end
end
