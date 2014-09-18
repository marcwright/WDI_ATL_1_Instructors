class MoviesController < ApplicationController

  def index
    @movies = []

    if params.has_key?(:q)
      title = params[:q].gsub(" ", "+")
      response = HTTParty.get("http://www.omdbapi.com/?s=#{title}")
      parsed_data = JSON(response)
      @movies = parsed_data["Search"]
    end
  end

  def show
    if params.has_key?(:imdb)
      response = HTTParty.get("http://www.omdbapi.com/?i=#{params[:imdb]}")
      @movie = JSON(response)
    else
      redirect_to root_path
    end
  end


end # END OF CONTROLLER

