require_relative './moma'

Artist.delete_all
Painting.delete_all

Artist.create(
  [
    { name: "Leonardo Da Vinci", nationality: "Italian"},
    { name: "Pablo Picasso", nationality: "Spanish"},
    { name: "Diego Rivera", nationality: "Mexican"},
    { name: "Frida Kahlo", nationality: "Mexican"},
    {name: "Vincent van Gogh", nationality: "Dutch"}
  ]
)

davinci = Artist.find_by(name: "Leonardo Da Vinci")
picasso = Artist.find_by(name: "Pablo Picasso")
diego = Artist.find_by(name: "Diego Rivera")
frida = Artist.find_by(name: "Frida Kahlo")
gogh = Artist.find_by(name: "Vincent van Gogh")

Painting.create(
    [
        {title: "Mona Lisa", artist: davinci},
        {title: "Guernica", artist: picasso},
        {title: "The House on the Bridge", artist: diego},
        {title: "Self-Portrait with Monkey", artist: frida},
        {title: "The Potato Eaters", artist: gogh}
    ]
)

