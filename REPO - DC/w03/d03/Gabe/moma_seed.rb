require_relative './moma.rb'
Artist.delete_all
Painting.delete_all


    picasso = Artist.create(name: "Pablo Picasso", nationality: "Spanish")
    vangogh = Artist.create(name: "Vincent Van Gogh", nationality: "Dutch")
    pollock = Artist.create(name: "Jackson Pollock", nationality: "American")

    nightcafe = Artist.create( title: "The Night Cafe", artist_id: 1)
    demoiselles = Artist.create(title: "Les Demoiselles d'Avignon", artist_id: 0)
    autumn = Artist.create( title: "Autumn Rhythm", artist_id: 2 )

