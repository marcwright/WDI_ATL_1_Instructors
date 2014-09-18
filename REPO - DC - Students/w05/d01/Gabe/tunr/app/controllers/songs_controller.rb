class SongsController < ApplicationController
  before_action :find_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
    redirect_to artists_path
  end

  def create
    @song = Song.create(song_params)
    @artist = Artist.find(params[:artist_id])
    redirect_to @song
  end

  def show

  end

  def edit

  end

  def update

    @song.update(song_params)
    redirect_to @song
  end

  def destroy

    @song.destroy
    redirect_to artist_songs_path
  end

private

def find_song
  @song = Song.find(params[:id])
end

def song_params
  params.require(:song).permit(:title, :year)
end

end
