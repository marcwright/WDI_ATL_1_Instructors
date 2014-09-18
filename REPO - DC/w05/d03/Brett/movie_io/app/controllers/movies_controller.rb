class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def new
    if params[:title]
      @title = params[:title].gsub(" ", "+")
      response = HTTParty.get("http://www.omdbapi.com/?s=#{@title}")
      @response_hash = JSON(response)

      render :new
    end
  end

  def create
    Movie.create(title: params[:title], year: params[:year], imdb_rating: params[:imdb_rating], plot: params[:plot], poster_url: params[:poster_url] )
    redirect_to movies_path
  end

  def details
    @movie = Movie.new
    @title = params[:title].gsub(" ", "+")
    response = HTTParty.get("http://www.omdbapi.com/?t=#{@title}&plot=full")
    @response_hash = JSON(response)
  end


end
