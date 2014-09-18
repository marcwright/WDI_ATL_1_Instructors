class AlbumsController < ApplicationController
  respond_to :json

  def index
    @albums = Album.all
    respond_with @albums
  end

  def show
    @album = Album.find params[:id]
    respond_with @album, :include => :images
  end
end
