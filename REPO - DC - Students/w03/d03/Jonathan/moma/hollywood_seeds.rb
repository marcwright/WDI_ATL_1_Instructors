require_relative './hollywood.rb'

Role.delete_all
Actor.delete_all
Movie.delete_all

ford = Actor.create(first_name: "Harrison", last_name: "Ford")
fisher = Actor.create(first_name: "Carrie", last_name: "Fisher")
hamell = Actor.create(first_name: "Mark", last_name: "Hamell")


# vangogh.paintings.create(
#   [
#     { title: "Starry Night"},
#     { title: "Self-Portrait"}
#   ]
# )

# # starry = Painting.create(title: "Starry Night", artist: vangogh)
# # sp = Painting.create(title: "Self-Portrait", artist: vangogh)

# guernica = Painting.create(title: "Guernica", artist: picasso)
