class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def studentdashboard
    @courses = current_user.courses_participated
  end

  def artistdashboard
  end
end
