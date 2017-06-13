class PinsController < ApplicationController
  def create
    @pin = Pin.create(pin_params)
    @pin.artwork = Artwork.find(params[:artwork_id])
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { head :ok }
    end
  end

  private
  def pin_params
    params.require(:pin).permit(:left, :top, :numero)
  end
end
