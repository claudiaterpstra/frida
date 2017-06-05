class LecturesController < ApplicationController
before_action :set_course, only: [:new, :create, :show, :destroy]
before_action :set_lecture, only: [:show]
skip_after_action :verify_authorized

  def new
     @lecture = Lecture.new
     # authorize @lecture
  end

  def create
    @lecture = Lecture.new(lecture_params)
    # authorize @lecture
    @lecture.course = @course
    if @lecture.save
      redirect_to course_path(@course)
    else render :new
    end

    def show

    end

    def destroy
      # authorize @lecture
      @lecture.destroy
    end
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

    def set_lecture
    @lecture = Lecture.find(params[:id])
  end

  def lecture_params
    params.require(:lecture).permit(:title, :description, :url)
  end
end
