class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def create
  end

  def destroy
  end

end
