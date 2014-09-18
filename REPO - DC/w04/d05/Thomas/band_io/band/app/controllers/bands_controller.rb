class BandsController < ApplicationController

  def index
    @bands = Band.all
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.create(band_params)
    redirect_to "/bands"
  end

  def show
    @band = Band.find(params[:id])
  end

  private

  def band_params
    params.require(:band).permit(:name, :genre, :explicit_lyrics, :video_url)
  end

end
