class MoviesController < ApplicationController
  def index
    title = params[:movie][:title]
    search_response = call_omdb_api(title: title)
    @movies = search_response["Search"] || get_random_movies
  end

  def show
    id = params[:id]
    @movie = call_omdb_api(id: id)
    @poster = @movie.delete("Poster") unless @movie["Poster"] == "N/A"
  end

  private
  # returns search data from omdb api for a given movie title
  def call_omdb_api(options)
    search_params = case
    when options[:title] then { s: options[:title] }.to_query
    when options[:id] then { i: options[:id], plot: "full"}.to_query
    end

    request_url = "http://www.omdbapi.com/?" + search_params
    JSON(HTTParty.get request_url)
  end

  def get_random_movies
    results = 10.times.map do
      rand_id = "tt" + "%07d" % rand(1..100_000)
      call_omdb_api(id: rand_id)
    end
    @random_movies = true
    return results
  end
end
