class WatchlistController < ApplicationController
  def index
    @movies = Movie.all
  end
end
