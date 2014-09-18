class ArtistsController < ApplicationController
  before_action :find_artist, only: [:show, :edit, :update, :destroy]

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
    @song = Song.new
  end

  def create
    @artist = Artist.create(artist_params)
    redirect_to @artist
  end

  def show
    @songs = @artist.songs
  end

  def edit
    @artist = find_artist
  end

  def update
    @artist.update(artist_params)
    redirect_to @artist
  end

  def destroy
    @artist.destroy
    redirect_to artists_path
  end

private

  def find_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :genre, :photo_url)
  end

end
