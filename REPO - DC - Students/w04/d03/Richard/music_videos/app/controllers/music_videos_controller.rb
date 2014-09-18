class MusicVideosController < ApplicationController

  def index
    @music_videos = MusicVideo.all
    render :index
  end

  def new
    render :new
  end

  def create
    MusicVideo.create(title: params[:title], artist: params[:artist], year: params[:year], video_url: params[:video_url])
      redirect_to '/music_videos'
  end

  def show
    @video = MusicVideo.find(params[:id])
    render :show
  end

  def delete
    MusicVideo.find(params[:id]).destroy
    redirect_to '/music_videos'
  end

end
