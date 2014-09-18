class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    # @movie = Movie.create(movie_params)
    # redirect_to @movie
  end

  def show
  end

  def selection
    @title = get_movie_info(params[:title])
    binding.pry
  end

  def search
    # @title = get_movie_url(params[:q])
  end

  def results
    @movies = get_movie_url(params[:q])
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private

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
    response = HTTParty.get("http://www.omdbapi.com/?t=#{title}")
    response_hash = JSON(response)
    response_hash
  end
end
