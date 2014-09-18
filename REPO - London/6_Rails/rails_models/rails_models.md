# Rails models 

c. 1hr

- Movies app

  rails new movies -d postgresql

  cd movies
  
  touch app/models/movie.rb

  pry-rails to gemfile

  edit database.yml
    - what is YAML?

    - alter DB name (to same as "movie_app" from Sinatra 'movies with db' app last week), user, etc

  # movie.rb
  class Movie < ActiveRecord::Base
  end

    - what is "active_record"?
      ORM
      "An object that wraps a row in a database table or view, encapuslates the database access, and adds domain logic on that data" Martin Fowler

      It makes the easy SQL stuff trivial, and the hard SQL stuff possible.

      One table maps to one Ruby class (there is such a thing as Single Table Inheritance though, but it's not for whimsy...)

      Columns map to methods, and are inferred from the schema.

    
    http://guides.rubyonrails.org/v3.2.17/active_record_querying.html

    rails c

    Movie

    Movie.count

    Movie.all.class

    Movie.all

    Movie.where(id: 1) # make sure the id exists!

    Movie.find(1)

    # note the difference that "where" returns an array, while "find" returns a single object - recall the clunkyness of having to do this manually in Sinatra

    Movie.where(year: %w(1999 1994 1986))

    Movie.where(["year in (?)", %w(1999 1994 1986)])

    Movie.where(["year in (:years)", years: %w(1999 1994 1986)])

    Movie.order(:genre)

    Movie.order('genre DESC')

    Movie.where(year: %w(1999 1994 1986)).order(:genre)

  - Create and retrive

    m = Movie.new
    m.title = "Star Wars"
    m.year = 1977
    m.save
    Movie.last

    m = Movie.new(title: "The Empire Strikes Back")
    m.save
    # we have to tell Rails which fields we want to be "accessible" to mass-assignment
      # this is nothing to do with accessors though!

    attr_accessible :title, :genre, :year

    reload!

    Movie.last

    m = Movie.create(title: "The Return of the Jedi")
    Movie.last

    m = Movie.find_by_title("Star Wars")

    Movie.find_all_by_title("Star Wars")

    m.update_attributes(title: "Star Wars: A New Hope", genre: "space opera") 
    m = Movie.find_by_title("Star Wars")

    m.destroy
    # There is a ".delete", but stick to '.destroy' as it does more that just fire a DB query


