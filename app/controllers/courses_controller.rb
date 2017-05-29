class CoursesController < ApplicationController
skip_before_action :authenticate_user!, only: :index
before_action :set_course, only: [:show, :destroy]
def index
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to course_path(@course)
    else render :new
    end
  end

  def destroy
    @course.destroy
    redirect_to course_path
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :category, :description, :price, :rating)
  end
end
