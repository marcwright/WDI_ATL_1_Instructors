#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-16 15:49:37
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-16 21:39:54

class BandsController < ApplicationController
  before_action :find_band, only: [:show, :edit, :update, :destroy]

  def index
    @bands = Band.all
  end

  # Pass an empty venue
  def new
    @band = Band.new
  end

  def create
    @band = Band.create(band_params)
    redirect_to @band
  end

  def show
    @youtube_embed = youtube_embed(@band.video_embed_url)
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

  # Security measure that builds white-listed params object to send over
  def band_params
    params.require(:band).permit(:name, :genre, :explicit_lyrics, :video_embed_url)
  end

  # Helper method for embedding a YouTube video based on URL (Douglas F Shearer via Stack Overflow)
  def youtube_embed(youtube_url)
  if youtube_url[/youtu\.be\/([^\?]*)/]
    youtube_id = $1
  else
    # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
    youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
    youtube_id = $5
  end
end


end
