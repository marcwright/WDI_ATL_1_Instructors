class MarkersController < ApplicationController
  def index
    @markers = Marker.all
    render json: @markers
  end

  def create
    @marker = Marker.new marker_params

    if @marker.save
      head :ok
    else
      head :bad_request
    end
  end

  private
  def marker_params
    params.require(:marker).permit :latitude, :longitude
  end
end