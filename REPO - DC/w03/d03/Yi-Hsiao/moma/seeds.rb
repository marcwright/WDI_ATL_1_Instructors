require_relative "moma"

Painting.delete_all
Artist.delete_all

van_gogh = Artist.create(name: "Vincent Van Gogh", nationality: "Dutch")
van_gogh.paintings.create(title: "Starry Night")

picasso = Artist.create(name: "Picasso", nationality: "Spanish")
picasso.paintings.create(title: "Guernica")
