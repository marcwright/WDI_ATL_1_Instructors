require_relative './moma'

Artist.delete_all
Painting.delete_all

Artist.create(
  [
    { first_name: "Vincent", last_name: "Van Gogh", nationality: "Netherlands" }
  ]
)

Painting.create(
  [
    { title: "Stary Night" }
  ]
)
