require_relative "models/config"
require_relative "models/rollercoaster"

RollerCoaster.create(
  name: "Superman",
  min_height: 5,
  top_speed: 73,
  image_url: "http://upload.wikimedia.org/wikipedia/commons/2/2c/Superman_-_Ride_of_Steel_(Six_Flags_America)_03.JPG"
  )

RollerCoaster.create(
  name: "Little Dipper",
  min_height: 4,
  top_speed: 20,
  image_url: "http://parkthoughts.com/wp-content/uploads/2009/11/sfgalittledipper.jpg"
  )
