class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :destroy]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create

  end

  def show
    @title = get_movie_info(params[:q])
  end

  def search

  end

  def results
    @movies = get_movie_url(params[:q])
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :year, :imdb_rating, :plot, :poster_url)
  end

  def get_movie_url(movie)
    movie = movie.gsub(" ", "+")
    response = HTTParty.get("http://www.omdbapi.com/?s=#{movie}")
    response_hash = JSON(response)
    response_hash["Search"]
  end

  def get_movie_info(title)
    title = title.gsub(" ", "+")
    response = HTTParty.get("http://www.omdbapi.com/?t=#{movie}")
    response_hash = JSON(response)
    response_hash["Search"]
  end
end
