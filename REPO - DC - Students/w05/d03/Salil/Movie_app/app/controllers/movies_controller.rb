class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def search
  end

  def results
     @results = get_movies(params[:query])
  end

  def selection

    @selection = get_movie(params[:title])
    binding.pry
  end

  def new
  end

  def create
  end

  def show

  end

  def destroy
  end

private

def get_movies(query)
  title = query.gsub(" ", "+")
  response = HTTParty.get("http://www.omdbapi.com/?s=#{title}")
  response_hash = JSON(response)
  return response_hash["Search"]
end

def get_movie(movie)
  title = movie.gsub(" ", "+")
  response = HTTParty.get("http://www.omdbapi.com/?t=#{title}")
  response_hash = JSON(response)
  return response_hash
end




end
