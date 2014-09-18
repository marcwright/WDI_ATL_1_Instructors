# HTTP Client API

We're going to use a couple of tools and techniques which might have some utility in your final projects, or day-to-day jobs.
We're going to use then (familiar) HTTParty gem, and another gem to manipulate the results that are returned. Lastly, we're going to make use of the "presenter" pattern to build an object to make the results more maleable.

We will be using http://mymovieapi.com/

To start, create a new rails project:

    rails new imdbapi

In the GemFile add the gems:

    gem 'httparty'
    gem 'nokogiri' 
    gem ‘haml-rails’

...and `bundle`

We will create a new file called imdb_api.rb at the route of lib. This class will be responsible for making the call to the external API and returning the response.

    # lib/imdb.rb
    class Imdb

      URL = "http://mymovieapi.com"
      attr_reader :movies, :search

      def initialize search
        @search = search
        @movies = []
        values = {title: search, type: "xml", limit:10}
        url = [URL, "?", values.to-query].join
        response = HTTParty.get(url).body

        xml = Nokogiri::XML(response)
        xml.xpath("//IMDBDocumentList/item").each do |item|
          @movies << Movie.new(item)
        end
      end 
    end

Create a Ruby object to wrap each result from the API:

    # lib/movie.rb
    class Movie

      attr_reader :title, :year, :actors, :picture
      def initialize xml
        @xml = xml
        parse
      end

      def parse
        @title = @xml.xpath("title").text

        @year = @xml.xpath("year").text
        @actors = @xml.xpath("actors/item").map(&:text)
        @picture = @xml.xpath("poster").text
      end
    end

Now we can create a movies controller to handle the request. 

    # controllers/movies_controller.rb
    class MoviesController < ApplicationController
      def index
        @imdb = Imdb.new params[:search]
      end
    end

Change the routes to root to this new controller:

    root to: 'movies#index'

This will not work yet, we will need to change the config to load it manually:
in `config/application.rb` uncomment:

    config.autoload_path += %w({config.root}/lib)

You will now need to restart the server as we have changed a config file.


create a new movies folder and index file inside the views:

    #views/movies/index.html.erb
    %h1 Movies
    = form_tag root_path do
      = text_field_tag :search, @imdb.search
      = button_tag "search"

    - @imdb.movies.each do |movie|
      %h2
        = movie.title
        (
        = movie.year
        )
      -unless movie.picture.blank?
        =image_tag movie.picture
      = movie.actors.to_sentence
