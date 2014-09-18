class PinsController < ApplicationController

  def index
    @pins = Pin.all
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
    params.require(:pin).permit(:latitude, :longitude)
  end

end
