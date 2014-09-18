class StaticController < ApplicationController
  def index
    @albums = Album.all
  end
end
