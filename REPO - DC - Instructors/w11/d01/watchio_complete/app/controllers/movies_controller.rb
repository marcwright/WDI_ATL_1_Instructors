class MoviesController < ApplicationController

  def index
    render json: Movie.order("title ASC").all
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: @movie
    else
      render status: 400, nothing: true
    end
  end

  def show
    @movie = Movie.find(params[:id])

    if @movie
      render json: @movie
    else
      render status: 400, nothing: true
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(movie_params)
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