class SongsController < ApplicationController
  before_action :find_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
    @artist = Artist.find(params[:artist_id])
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = Song.create(song_params)
    redirect_to artist_song_path(@artist, @song)
  end

  def show
  end

  def edit
  end

  def update
    @song.update(song_params)
    redirect_to artist_song_path(@song.artist, @song)
  end

  def destroy
    a = @song.artist
    @song.destroy
    redirect_to a
  end

  private

  def find_song
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :video_url, :artist_id)
  end

end
