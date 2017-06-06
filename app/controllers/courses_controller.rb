class CoursesController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
before_action :set_course, only: [:show, :edit, :update, :destroy]
  def index
    @courses = policy_scope(Course).order(created_at: :desc)
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
    authorize @course
  end

  def create
    @course = Course.new(course_params)
    authorize @course
    @course.user = current_user
    @course.rating = 0
    @course.published = false
    if @course.save
      redirect_to course_path(@course)
    else render :new
    end
  end

  def edit
    authorize @course
  end

  def update
    @course.update(course_params)
    redirect_to course_path
  end

  def destroy
    @course.destroy
    redirect_to artistdashboard_path
  end

  private

  def set_course
    @course = Course.find(params[:id])
    authorize @course
  end

  def course_params
    # Missing strong params for materials?
    params.require(:course).permit(:name, :category, :description, :price, :rating, :photo, :search, :course_materials)
  end
end
