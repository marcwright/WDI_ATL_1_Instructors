require_relative './moma'

Artist.delete_all
Painting.delete_all

monet = Artist.create({ name: "Claude Monet", nationality: "French"}
basquiat = Artist.create({name: "Jean-Michel Basquiat", nationality: "American"})
kahlo = Artist.create({name: "Frida Kahlo", nationality: "Mexican"})


monet.paintings.create({title: "", artist: monet})

basquiat.paintings.create({title: "", artist: basquiat})

kahlo.paintings.create({title: "", artist: kahlo})
