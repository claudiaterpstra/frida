class PagesController < ApplicationController
  before_action :set_current_user, only: [:dashboard, :account, :manage_courses, :studio, :give_feedback]

  skip_before_action :authenticate_user!, only: [ :home, :about ]
  skip_after_action :verify_authorized, only: [ :home, :studentdashboard, :dashboard ]

  def home
  end

  def about
  end

  def dashboard
    @courses = current_user.courses_participated
    @artworks = Artwork.all.where(user: @user)
  end

  def account
  end

  def studio
    @feedback = Feedback.new
    # @pins = Pin.order(numero: :asc)
    @courses = @user.courses_participated
    @lectures = @user.courses_participated.collect(&:lectures).flatten
    @artworks_count = @user.artworks.count


    if params[:lecture]
      @artworks = current_user.artworks.where(lecture: Lecture.find(params[:lecture]))
    elsif params[:course]
      @artworks = Course.find(params[:course]).artworks.where(user: current_user)
    else
      @artworks = @user.artworks
    end
  end

  def manage_courses
    @courses = @user.courses
  end

  def studentdashboard
    @courses = current_user.courses_participated
  end

  def artistdashboard
    authorize current_user
  end

  def give_feedback
    @feedback = Feedback.new
    @courses = @user.courses
    @lectures = @user.lectures
    @students = @user.students

    if params[:lecture]
      @artworks = Lecture.find(params[:lecture]).artworks
    elsif params[:course]
      @artworks = Course.find(params[:course]).artworks
    elsif params[:student]
      @artworks = User.find(params[:student]).artworks
    else
      @artworks = @user.student_artworks
    end
  end

  private

  def set_current_user
    @user = current_user
  end

end
