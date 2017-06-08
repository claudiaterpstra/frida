class PagesController < ApplicationController

  before_action :set_current_user, only: [:dashboard, :account, :manage_courses, :studio]

  skip_before_action :authenticate_user!, only: [ :home ]
  skip_after_action :verify_authorized, only: [ :home, :studentdashboard, :dashboard ]

  def home
  end

  def dashboard
    @courses = current_user.courses_participated
    @artworks = Artwork.all.where(user: @user)
  end

  def account
  end

  def studio
    @artworks_all = current_user.artworks
    if params[:lecture]
      @lecture = Lecture.find_by_title(params[:lecture])
      @artworks = current_user.artworks.where(lecture_id: @lecture.id)
    else
      @artworks = current_user.artworks
    end

    @lectures = []
    @artworks_all.each do |art|
      @lectures << art.lecture
    end

    @feedback = Feedback.new
  end

  def manage_courses
   @courses = Course.all.where(user: @user)

   @artworks = []
   @courses.each do |course|
    course.lectures.each do |lecture|
      lecture.artworks.each do |artwork|
        @artworks << artwork
      end
    end
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
