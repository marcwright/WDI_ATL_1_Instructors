require_relative 'movie'

Movie.delete_all

Movie.create(
  [
    { title: "Spiderman 2", year: 2014 },
    { title: "Catching Fire", year: 2013 },
    { title: "War of the Worlds", year: 2007 },
    { title: "Mission Impossible", year: 2000 },
    { title: "Hunger Games", year: 2012 }
  ]
)
