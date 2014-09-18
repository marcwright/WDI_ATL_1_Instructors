class SongsController < ApplicationController
  before_action :find_song_and_artist, except: [:new, :create]
  def edit

  end

  def update
    @song.update(song_params)
    redirect_to artist_path(@artist)
  end

  def new
    @song = Song.new
    @artist = Artist.find(params[:artist_id])
  end

  def create
    @song = Song.create(song_params)
    @artist = Artist.find(@song.artist_id)
    redirect_to artist_path(@artist)
  end

  def destroy
    @song.destroy
    redirect_to artist_path(@artist)
  end

  private

  def find_song_and_artist
    @song = Song.find(params[:id])
    @artist = Artist.where(id: @song.artist_id)
  end

  def song_params
    params.require(:song).permit(:title,:year,:artist_id)
  end


end
