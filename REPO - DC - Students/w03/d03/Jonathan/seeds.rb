require_relative './moma.rb'

Artist.delete_all
Painting.delete_all

vangogh = Artist.create(name: "Vincent Van Gogh", nationality: "Dutch")
picasso = Artist.create(name: "Pablo Picasso", nationality: "Spanish")
greco = Artist.create(name: "El Greco", nationality: "Spanish")


vangogh.paintings.create(
  [
    { title: "Starry Night"},
    { title: "Self-Portrait"}
  ]
)

# starry = Painting.create(title: "Starry Night", artist: vangogh)
# sp = Painting.create(title: "Self-Portrait", artist: vangogh)

guernica = Painting.create(title: "Guernica", artist: picasso)
