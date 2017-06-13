class PinsController < ApplicationController
  skip_after_action  :verify_authorized

  def create
    @pin = Pin.new(pin_params)
    @pin.artwork = Artwork.find(params[:artwork_id])
    @pin.save
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
