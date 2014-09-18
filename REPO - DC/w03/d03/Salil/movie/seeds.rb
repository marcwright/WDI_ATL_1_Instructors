require_relative './movie'

Movie.delete_all
Actor.delete_all
Role.delete_all

Movie.create(
  [
    {name: "Her", year: 2014}
    {name: "Safety Not Guaranteed", year: 2011}
    {name: "O Brother Where Art Thou", year: 2000}
    {name: "The Prestige" year: 2006}
  ]
)

Actor.create(






    )

