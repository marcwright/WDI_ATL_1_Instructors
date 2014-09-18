class PinsController < ApplicationController

  def index
    @pins = Pin.all
    respond_to do |format|
      format.json { render json: @pins}
      format.html
    end
  end

  def create
    @pin = Pin.new(pin_params)

    if @pin.save
      render json: @pin
    else
      render status: 400, nothing: true
    end
  end

  private
  def pin_params
    params.require(:pin).permit(:lat, :long)
  end
end
