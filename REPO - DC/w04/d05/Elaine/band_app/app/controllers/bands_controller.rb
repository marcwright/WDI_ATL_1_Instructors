class BandsController < ApplicationController
  before_action :find_band, only: [:show, :edit, :update, :destroy]

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

    youtube_url = @band.video_embed_url

    if youtube_url[/youtu\.be\/([^\?]*)/]
      @youtube_id = $1
    else
      # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      @youtube_id = $5
    end

  end

  def edit
  end

  def update
    @band.update(band_params)
    redirect_to @band
  end

  def destroy
    @band.destroy
    redirect_to bands_path
  end

  private

  def find_band
    @band = Band.find(params[:id])
  end

  def band_params
    params.require(:band).permit(:name, :genre, :explicit_lyrics, :video_embed_url)
  end
end
