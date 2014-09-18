class SongsController < ApplicationController
  before_action :find_song, only: [:edit, :update, :destroy]



  def new
    @song = Song.new
    @artist = Artist.find(params[:artist_id])
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @artist.songs.create(song_params)
    redirect_to @artist
  end


  def edit
    @song = find_song
  end

  def update
    @song.update(song_params)
    redirect_to @song
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
    params.require(:song).permit(:year, :title)
  end

end
