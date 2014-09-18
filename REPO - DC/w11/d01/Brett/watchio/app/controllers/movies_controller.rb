class MoviesController < ApplicationController

  def index
    @movies = Movie.order("title ASC")

    if @movies
      render json: @movies
    else
      render status: 400, nothing: true
    end
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: @movie
    else
      render status: 400, nothing: true
    end
  end

  def destroy
     @movie = Movie.find(params[:id])

    if @movie.destroy
      render json: {}
    else
      render status: 400, nothing: true
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :imdb_id)
  end

end
