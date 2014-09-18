class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
  end

  def search
  end

  def results
    search = params[:query].gsub(" ","+")
    response = HTTParty.get("http://www.omdbapi.com/?s=#{search}")
    response_hash = JSON(response)
    @results =  response_hash["Search"]
  end

  def show
    search = params[:title].gsub(" ","+")
    response = HTTParty.get("http://www.omdbapi.com/?t=#{search}")
    response_hash = JSON(response)
    @film = response_hash
  end

  def destroy
  end
end
