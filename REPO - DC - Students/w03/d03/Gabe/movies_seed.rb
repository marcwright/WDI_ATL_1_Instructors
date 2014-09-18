require_relative './movies.rb'
Role.delete_all
Actor.delete_all
Movie.delete_all


    dicaprio = Actor.create(name: "Leonardo DiCaprio")
    cage = Actor.create(name: "Nicholas Cage")
    ford = Actor.create(name: "Harrison Ford")

    titanic = Role.create( actor_id: 1, movie_id: 1)
    conair = Role.create( actor_id: 2, movie_id: 2)
    fugitive = Role.create( actor_id: 3, movie_id: 3)

    titanic = Movie.create( title: "Titanic")
    conair = Movie.create(title: "Con Air")
    fugitive = Movie.create( title: "The Fugitive")
