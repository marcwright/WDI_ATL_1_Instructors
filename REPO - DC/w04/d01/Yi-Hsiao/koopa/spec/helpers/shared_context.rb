shared_context "visits the site with existing koopa profiles" do
  Koopa.create(
    name: "Beach Koopa",
    color: "green",
    has_shell: true,
    photo_url: "/img/beach_koopa.png"
  )

  Koopa.create(
    name: "Boom Boom",
    color: "red",
    has_shell: true,
    photo_url: "/img/boom_boom.png"
  )

  Koopa.create(
    name: "Chargin' Chuck",
    color: "blue",
    has_shell: true,
    photo_url: "/img/chargin_chuck.png"
  )
end
