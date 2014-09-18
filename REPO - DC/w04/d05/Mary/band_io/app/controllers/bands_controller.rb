class BandsController < ApplicationController
  def index
    @bands = Band.all
  end

  def new
  end

  def create
    @band = Band.create(band_params)
    redirect_to @band
  end

  def show
    @band = Band.find(params[:id])
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_path
  end

  private
  def band_params
    params.require(:band).permit(:name, :genre, :explicit_lyrics, :video_embed_url)
  end
end
