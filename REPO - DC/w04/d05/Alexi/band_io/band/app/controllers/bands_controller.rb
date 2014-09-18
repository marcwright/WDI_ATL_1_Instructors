class BandsController < ApplicationController
  before_action :find_band, only: [:show, :edit, :udpate, :destroy]

  # 'Index' is plural
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

  # 'Show' is singular
  def show
  end

  def edit
  end

  def udpate
    @band.update(band_params)
    redirect_to @band
  end

  def destroy
    @band.destroy
    redirect_to band_path
  end

private

  def find_band
    @band = Band.find(params[:id])
  end

  def band_params         
    params.require(:band).permit(:name, :genre, :explicit_lyrics, :video_url)
  end

end # END OF CLASS
