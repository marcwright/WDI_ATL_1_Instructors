class BandsController < ApplicationController

  def index
    redirect_to '/events'
  end

  def new
    @band = Band.new
  end

  def create
    @band=Band.create(band_params)
    redirect_to @band
  end

  def show
    @band = Band.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_venue
    @band = Band.find(params[:id])
  end

  def band_params
    params.require(:band).permit(:name, :genre, :explicit_lyrics, :video_embed_url)
  end

end
