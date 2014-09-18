class BandsController < ApplicationController
  before_action :find_band, only: [:name, :genre, :explicit_lyrics, :video_embed_url]

  def index
    @bands = Band.all
    render :index
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.create(band_params)
    redirect_to @band
  end

  def show
    @band = Band.all
    render :show
  end





  private

  def find_band
    @band = Band.find(params[:id])
  end

  def band_params
    params.require(:band).permit(:name, :genre, :explicit_lyrics, :video_embed_url)
  end



end

