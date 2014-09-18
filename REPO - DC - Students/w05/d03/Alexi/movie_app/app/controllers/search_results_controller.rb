# class SearchResultsController < ApplicationController
  
#   def index
#     @title = params[:movie]
#     @title = @title.gsub(" ", "+")
#     response = HTTParty.get("http://www.omdbapi.com/?s=#{@title}")
#     response_hash = JSON(response)
#     @movie_array = response_hash["Search"]
#   end

#   def show
#     @movie_array.each do |movie|
#       if movie["imdbID"] == params[:imdbID]
#         @chosen_movie = movie
#       end
#     end
#     return @chosen_movie

#     @movie_id = @movie_array[:imdbID]
#     response = HTTParty.get("http://www.omdbapi.com/?i=#{@movie_id}")
#     response_hash = JSON(response)
    
#     @movie_title = response_hash["Title"]
#     @movie_plot = response_hash["Plot"]
#     @movie_poster = response_hash["Poster"]
#     @movie_year = response_hash["Year"]
#     @movie_rating = response_hash["imdbRating"]
#   end

#   # def get_
#   # return response_hash[:Search][0][:imdbID]


# end # END OF CONTROLLER
