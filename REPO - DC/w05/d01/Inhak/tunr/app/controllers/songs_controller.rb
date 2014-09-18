class SongsController < ApplicationController
  before_action :find_artist, only: [:new, :create, :edit, :update, :destroy]

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    redirect_to @artist
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
    redirect_to @artist
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to @artist
  end

  private
  def song_params
    params.require(:song).permit(:title, :year, :artist_id)
  end

  def find_artist
    @artist = Artist.find(params[:artist_id])
  end
end
