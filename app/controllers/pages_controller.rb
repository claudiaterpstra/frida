class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  skip_after_action :verify_authorized, only: [ :home, :studentdashboard ]

  def home
  end

  def dashboard
    @user = current_user
  end

  def account
    @user = current_user
  end

  def studio
    @artworks = current_user.artworks
  end

  def my_courses
    @courses = current_user.courses_participated
  end

  def studentdashboard
    @courses = current_user.courses_participated
  end

  def artistdashboard
    authorize current_user
  end
end
