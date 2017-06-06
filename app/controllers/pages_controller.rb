class PagesController < ApplicationController

  before_action :set_current_user, only: [:dashboard, :account, :manage_courses, :studio]

  skip_before_action :authenticate_user!, only: [ :home ]
  skip_after_action :verify_authorized, only: [ :home, :studentdashboard, :dashboard ]

  def home
  end

  def dashboard
    @courses = current_user.courses_participated
  end

  def account
  end

  def studio
    @artworks = if params[:search]
      Artwork.where("category LIKE ?", "%#{params[:search]}%")
    else
      Artwork.all
    end
  end

  def manage_courses
    if current_user.courses_participated.count > 0
      @courses = current_user.courses_participated
    else
    end

  end

  def studentdashboard
    @courses = current_user.courses_participated
  end

  def artistdashboard
    authorize current_user
  end

  private

  def set_current_user
    @user = current_user
  end
end
