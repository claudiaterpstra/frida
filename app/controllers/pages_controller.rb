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

    if params[:search]
      @artworks = Artwork.where("category LIKE ?", "%#{params[:search]}%")
    elsif params[:lecture]
      @lecture = Lecture.find_by_title(params[:lecture])
      @artworks = Artwork.all.where(user: @user, lecture_id: @lecture.id)
    else
      @artworks = Artwork.all.where(user: @user)
    end



    @lectures = []
    @artworks.each do |art|
      @lectures << art.lecture
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
