class SongsController < ApplicationController
  before_action :find_song, only: [:new, :create, :edit, :update, :destroy]

  def new
    @song = Song.new
  end

  def create
    @artist = Artist.find(params[:id])
    @song = Song.create(song_params)
    redirect_to @artist
  end

  def edit
  end

  def update
  end

  def destroy
  end

private

  def find_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :year, :artist_id)
  end

end
