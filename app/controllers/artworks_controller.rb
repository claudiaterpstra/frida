class ArtworksController < ApplicationController
  skip_after_action :verify_authorized
  before_action :set_lecture, only: [:new, :create]
  before_action :set_artwork, only: [:show, :edit, :update, :destroy]

  def index
    @artworks = policy_scope(Artwork).order(created_at: :desc)
    @artworks = Artwork.all
  end

  def show
  end

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @artwork.lecture = @lecture
    @artwork.user = current_user
    if @artwork.save
      respond_to do |format|
        format.html { redirect_to lecture_path(@lecture) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'lectures/show' }
        format.js  # <-- idem
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @artwork.destroy
  end

  private

  def set_lecture
    @lecture = Lecture.find(params[:lecture_id])
  end

  def set_artwork
    @artwork = Artwork.find(params[:id])
  end

  def artwork_params
    params.require(:artwork).permit(:message, :photo)
  end

end
