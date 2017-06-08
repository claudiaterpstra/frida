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
    elsif params[:course]
      temp_art = current_user.artworks
      @artworks = []
      temp_art.each do |art|
        @artworks << art if art.course.id == params[:course].to_i
      end
      @artworks
    else
      @artworks = current_user.artworks
    end

    @lectures = []
    @courses = []
    @artworks_all.each do |art|
      @lectures << art.lecture
      @courses << art.lecture.course
    end

    @hash = {}
    @courses.uniq.each do |course|
      course.lectures.each do |lecture|
        if lecture.artworks.pluck(:user_id).include?(@user.id)
          count = lecture.artworks.pluck(:user_id).count(@user.id)
          count.times do
            @hash.keys.include?(lecture.course.id) ? @hash[lecture.course.id] += 1 : @hash[lecture.course.id] = 1
          end
        end
      end
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
