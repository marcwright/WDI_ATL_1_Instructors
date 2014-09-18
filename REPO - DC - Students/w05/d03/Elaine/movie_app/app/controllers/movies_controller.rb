class MoviesController < ApplicationController
  # before_action(:load_artist, only: [:new, :create] )
  before_action(:load_movie, { only: [:edit, :update, :destroy] })



  def search
    movie = params[:q].gsub(" ", "+")

    response = HTTParty.get("http://www.omdbapi.com/?s=#{movie}")
    response_hash = JSON(response)

    @search_results = response_hash["Search"]
  end



  def show
    imdb_id = params[:id]
    response = HTTParty.get("http://www.omdbapi.com/?i=#{imdb_id}")
    @response_hash = JSON(response)
  end


  def create

    @movie = @response_hash

    @movie.title = response_hash["Title"]
    @movie.year = response_hash["Year"]
    @movie.imdb_rating = response_hash["imdbRating"]
    @movie.plot = response_hash["Plot"]
    @movie.poster_url = response_hash["Poster"]

    @movie.save
  end

  private

  # def load_artist
  #   return @artist = Artist.find_by(id: params[:artist_id])
  # end

  def load_movie
    return @movie = Movie.find_by(id: params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :year)
  end


end
