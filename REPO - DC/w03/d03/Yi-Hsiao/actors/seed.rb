require_relative "actors"

Role.delete_all
Actor.delete_all
Movie.delete_all

godfather = Movie.create(title: "The Godfather", year: 1972)
godfather_2 = Movie.create(title: "The Godfather II", year: 1974)

marlon_brando = Actor.create(name: "Marlon Brando", birthday: "1924-04-03")
al_pacino = Actor.create(name: "Al Pacino", birthday: "1940-04-25")

Role.create(actor: marlon_brando, movie: godfather, character: "Don Vito Corleone")
Role.create(actor: marlon_brando, movie: godfather_2, character: "Don Vito Corleone")
Role.create(actor: al_pacino, movie: godfather, character: "Michael Corleone")
Role.create(actor: al_pacino, movie: godfather_2, character: "Michael Corleone")
