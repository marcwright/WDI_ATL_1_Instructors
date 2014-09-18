class SongsController < ApplicationController

def new
  @song = Song.new
  @artist = Artist.find(params[:artist_id])
end

def create
  @song = Song.create(song_params)
  @artist = @song.artist
  redirect_to @artist
end

def destroy
  @song.destroy
end

private

def song_params
  params.require(:song).permit(:title, :year, :artist_id)
end

end
