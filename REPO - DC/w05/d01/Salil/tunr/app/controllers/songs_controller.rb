class SongsController < ApplicationController

  before_action :find_song, only: [:edit, :update, :destroy]


  def new
    @artist = Artist.find(params[:artist_id])
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    @artist = Artist.find(params[:artist_id])
    redirect_to @artist
  end

  def edit
  end

  def update
    @song.update(song_params)
    redirect_to @artist
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private

  def find_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :year, :artist_id)
  end

end
