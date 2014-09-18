class PinsController < ApplicationController
  def index
    @pins = Pin.all
    render json: @pins
  end

  def create
    @pin = Pin.new(pin_params)

    if @pin.save
      head :ok
    else
      head :bad_request
    end
  end

  private
  def pin_params
    params.require(:pin).permit :latitude, :longitude
  end
end
