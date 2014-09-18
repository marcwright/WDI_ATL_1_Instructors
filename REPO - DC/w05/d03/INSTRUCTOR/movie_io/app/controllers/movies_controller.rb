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
    response = HTTParty.get("http://www.omdbapi.com/?i=#{params[:omdb_id]}")
    response_hash = JSON(response)
    @movie = Movie.new(
      title: response_hash["Title"],
      year:  response_hash["Year"],
      imdb_rating:  response_hash["imdbRating"],
      imdb_id: params[:omdb_id],
      plot:  response_hash["Plot"],
      poster_url: response_hash["Poster"]
    )
    if @movie.save
      redirect_to '/'
    else
      flash[:error] = @movie.errors.to_s
      redirect_to "/movies/#{params[:ombd_id]}"
    end
  end

  private

  def load_movie
    return @movie = Movie.find_by(id: params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :year)
  end


end
