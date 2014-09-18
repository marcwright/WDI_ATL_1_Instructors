require_relative "../models/config"
require_relative "../models/clown"

Clown.create(
  name: "Pennywise",
  talent: "making things float",
  is_creepy: true,
  image_url: "/clown_1.gif"
)

Clown.create(
  name: "Ronald McDonald",
  talent: "luring you into ball pits",
  is_creepy: true,
  image_url: "/clown_2.jpg"
)

Clown.create(
  name: "Zeebo",
  talent: "laughing in the dark",
  is_creepy: true,
  image_url: "/clown_3.jpg"
)
