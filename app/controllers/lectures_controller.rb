class LecturesController < ApplicationController
before_action :set_course, only: [:new, :create]
before_action :set_lecture, only: [:show, :edit, :update]
skip_before_action :authenticate_user!, only: [:index, :show]
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
      redirect_to lecture_path(@lecture)
    else
      render :new
    end
  end

  def show
    @artwork = Artwork.new
    @artworks = current_user.artworks.where(lecture_id: @lecture.id)
  end

  def edit
  end

  def update
    @lecture.update(lecture_params)
    redirect_to course_path(@lecture.course)

  end

    def destroy
      # authorize @lecture
      @lecture.destroy
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
