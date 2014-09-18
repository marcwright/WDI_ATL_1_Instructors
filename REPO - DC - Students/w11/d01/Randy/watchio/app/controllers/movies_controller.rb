class MoviesController < ApplicationController

  def index
    @movies = Movie.all

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
    @movie = Movie.find(params[:imdbID])

    if @student.destroy
      render json: {}
    else
      render status: 400, nothing: true
    end
  end

  private

    def movie_params
      params.require(:movie).permit(:title, :imdbID)
    end

end
