# Stephen Stanwood (stephen@stanwoodsolutions.com)

# DROP TABLE IF EXISTS artists CASCADE;
# CREATE TABLE artists (
#   id SERIAL PRIMARY KEY,
#   name VARCHAR(100) NOT NULL,
#   nationality VARCHAR(100) NOT NULL
# );

# DROP TABLE IF EXISTS paintings CASCADE;
# CREATE TABLE paintings (
#   id SERIAL PRIMARY KEY,
#   title VARCHAR(100) NOT NULL,
#   artist_id INTEGER REFERENCES artists(id)
# );

require 'active_record'
require 'pry'

# Logger will print out the actual SQL that runs to the Terminal
ActiveRecord::Base.logger = Logger.new(STDOUT)

# Connect to our postgres database for musicals
ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "stephenstanwood",
  :password => "",
  :database => "moma_db")

class Artist < ActiveRecord::Base
  has_many :paintings

  def to_s
    return name
  end
end

class Painting < ActiveRecord::Base
  belongs_to :artist

  def to_s
    return "\"#{title}\" (by #{artist.to_s})"
  end
end

Painting.destroy_all
Artist.destroy_all

Artist.create([
  { name: "Claude Monet", nationality: "French" },
  { name: "Pablo Picasso", nationality: "Spanish" },
  { name: "Mark Rothko", nationality: "American" }
])

Painting.create([
  { title: "Haystacks", artist_id: Artist.find_by(name: "Claude Monet").id },
  { title: "Guernica", artist_id: Artist.find_by(name: "Pablo Picasso").id },
  { title: "No. 14", artist_id: Artist.find_by(name: "Mark Rothko").id }
])

# 1. Create a new Artist (Vincent Van Gogh) and save him to your database
Artist.create(name: "Vincent Van Gogh", nationality: "Dutch")

# 2. Create a new Painting (Starry Night) and save it to your database
Painting.create(title: "The Starry Night", artist_id: Artist.find_by(name: "Vincent Van Gogh").id)

# 3. Return all Artists
puts "# 3. Return all Artists"
puts Artist.all
puts

# 4. Return all Paintings
puts "# 4. Return all Paintings"
puts Painting.all
puts

# 5. Return the artist with an id of 2
puts "# 5. Return the artist with an id of 2"
puts Artist.where(id: 2)
puts

# 6. Return the artist with a name of "Vincent Van Gogh"
puts "# 6. Return the artist with a name of Vincent Van Gogh"
puts Artist.where(name: "Vincent Van Gogh")
puts

# 7. Return all the artists who are "Spanish"
puts "# 7. Return all the artists who are Spanish"
puts Artist.where(nationality: "Spanish")
puts

# 8. Return the painting with an id of 1
puts "# 8. Return the painting with an id of 1"
puts Painting.where(id: 1)
puts

# 9. Return the painting with a name of "Guernica"
puts "# 9. Return the painting with a name of Guernica"
puts Painting.where(title: "Guernica")
puts

# 10. Return all the paintings that "Pablo Picasso" painted
puts "# 10. Return all the paintings that Pablo Picasso painted"
puts Painting.where(artist: Artist.find_by(name: "Pablo Picasso"))
puts

# 11. Return the artist of "Guernica"
puts "# 11. Return the artist of Guernica"
puts Painting.where(title: "Guernica").first.artist
puts

# 12. Change Vincent Van Gogh's nationality to "American"
puts "# 12. Change Vincent Van Gogh's nationality to American"
Artist.find_by(name: "Vincent Van Gogh").update(nationality: "American")

# 13. Change "Starry Night" to be one of Pablo Picasso's paintings
puts "# 13. Change Starry Night to be one of Pablo Picasso's paintings"
p = Painting.find_by(title: "The Starry Night")
p.update(artist: Artist.find_by(name: "Pablo Picasso"))
