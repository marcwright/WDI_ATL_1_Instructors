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
    @artist = Artist.find(params[:artist_id])
  end

  def update
    @artist = Artist.find(params[:artist_id])
    @song.update(song_params)
    redirect_to @artist
  end

  def destroy
    @song.destroy
    redirect_to artist_path
  end

end


private

  def find_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:name, :year, :artist_id)
  end
