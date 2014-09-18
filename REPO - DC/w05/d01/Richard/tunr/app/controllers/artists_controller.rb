class ArtistsController < ApplicationController

  before_action :find_artist, only: [:show, :edit, :update, :destroy]

  def index
    @artist = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def show
    @songs = @artist.songs
  end

  def create
    @artist=Artist.create(artist_params)
    redirect_to @artist
  end

  def edit
  end

  def update
    @artist.update(artist_params)
    redirect_to @artist
  end

   def destroy
    @artist = Artist.find(params[:id])
    @songs = @artist.songs
    redirect_to @artist
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :genre, :photo_url)
  end

  def find_artist
    @artist = Artist.find(params[:id])
  end

end
