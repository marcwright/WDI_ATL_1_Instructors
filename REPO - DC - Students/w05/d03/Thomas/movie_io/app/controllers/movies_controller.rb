class MoviesController < ApplicationController

  def index
  end

  def search
    @title = (params[:q])

    response = HTTParty.get("http://www.omdbapi.com/?s=#{@title}")
    response_hash = JSON(response)
    @output = response_hash["Search"] #a long array of hashes

  end

  def show

    movie_id = (params[:id])

    response = HTTParty.get("http://www.omdbapi.com/?i=#{movie_id}")
    response_hash = JSON(response)
    @single_movie_info = response_hash
  end


end
