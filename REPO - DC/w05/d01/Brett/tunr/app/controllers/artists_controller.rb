class ArtistsController < ApplicationController
  before_action :find_artist, only: [:show, :edit, :update, :destroy]

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)
    redirect_to @artist
  end

  def show
    @artist = find_artist
    @songs = @artist.songs
  end

  def edit
  end

  def update
    @artist.update(artist_params)
    redirect_to @artist
  end

  def destroy
    @artist.destroy
    redirect_to new_artist_path
  end

  private

  def find_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit( :name, :genre, :photo_url )
  end

end
