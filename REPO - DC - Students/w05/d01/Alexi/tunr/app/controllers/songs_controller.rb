class SongsController < ApplicationController
  before_action :find_song, only: [:show, :edit, :update, :destroy]

  def new
    @artist = Artist.new(artist_params)
  end

  def create
    @artist = Artist.create(artist_params)
    @artist.song.create = (song_params)
    redirect_to @artist
  end

  def show
  end

  def edit
  end

  def update
    @song.update(artist_params)
    redirect_to @artist
  end

private

def find_song
  @song = Artist.find(params[:id]).songs
end

def song_params
  params.require(:song).permit(:title, :years)
end

end
