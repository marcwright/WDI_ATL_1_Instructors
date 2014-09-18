#This controller determines how the information retrieved from ActiveRecord via the band.rb model file is distributed to the online view.  It's like a filter that processes and arranges the data a certain way.
class BandsController < ApplicationController
  before_action :find_band, only: [:show, :destroy]

  def index
    @bands = Band.all
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.create(band_params)
    redirect_to @band
  end

  def show
  end

  def destroy
    @band.destroy
    redirect_to bands_path
  end

  private

#find_band is used to isolate a section of code that is repeated throughout the controller methods.  Breaking it out and then calling it above in the before_action effectively DRYs up the code.
  def find_band
    @band = Band.find(params[:id])
  end

#band_params 'white-lists' data, to avoid anyone trying to hack into the data fields.  White-listing means to INCLUDE only the data listed in the .permit parens, whereas black-listing would specify which attributes to EXCLUDE.
  def band_params
    params.require(:band).permit(:name, :genre, :explicit, :video_url)
  end
end
