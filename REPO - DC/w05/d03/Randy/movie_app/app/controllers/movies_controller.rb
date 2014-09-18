class MoviesController < ApplicationController

  def search
  end

  def list
    title = params[:title].gsub(" ", "+")
    response = HTTParty.get("http://www.omdbapi.com/?i=&s=#{title}")
    response_hash = JSON(response)
    @movies = response_hash["Search"]
  end

  def show
    title = params[:title].gsub(" ", "+")
    response = HTTParty.get("http://www.omdbapi.com/?i=&t=#{title}")
    @movie = JSON(response)
  end

  def create
    Movie.create(title: params[:movie][:title])
    redirect_to movies_path
  end

  def index
    @movies = Movie.all
  end

  private

  def movie_params
    params.require(:movies).permit(:title)
  end

end
