class CoursesController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
before_action :set_course, only: [:show, :edit, :update, :destroy]
  def index
    @courses = if params[:search]
      Course.where("category LIKE ?", "%#{params[:search]}%")
    else
      Course.all
    end
  end

  def show
    @participation = Participation.new
    @course_review = CourseReview.new
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.user = current_user
    @course.rating = 0
    if @course.save
      redirect_to course_path(@course)
    else render :new
    end
  end

  def edit
  end

  def update
    @course.update(course_params)
    redirect_to course_path
  end

  def destroy
    @course.destroy
    redirect_to dashboard_path
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :category, :description, :price, :rating, :photo, :search)
  end
end
