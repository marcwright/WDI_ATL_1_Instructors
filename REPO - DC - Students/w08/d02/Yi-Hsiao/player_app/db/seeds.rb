# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Song.destroy_all
p "Cleared all songs"

Song.create([
  { :artist       => "Iggy Azalea",
    :title        => "Fancy",
    :preview_url  => "https://play.spotify.com/track/3oqCnpAoHf3SDFynxx7AU4"
  },
  { :artist       => "Ariana Grande",
    :title        => "Problem",
    :preview_url  => "https://play.spotify.com/track/3cySlItpiPiIAzU3NyHCJf"
  },
  { :artist       => "Calvin Harris",
    :title        => "Summer",
    :preview_url  => "https://play.spotify.com/track/7b71WsDLb8gG0cSyDTFAEW"
  }
])
p "Added songs to DB"