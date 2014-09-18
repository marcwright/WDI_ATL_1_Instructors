# Stephen Stanwood (stephen@stanwoodsolutions.com)

# CREATE TABLE musicals (
#   id SERIAL PRIMARY KEY,
#   title VARCHAR(100) NOT NULL,
#   year INTEGER NOT NULL,
#   composer VARCHAR(100) NOT NULL,
#   lyricist VARCHAR(100) NOT NULL
# );

require 'pg'
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
  :database => "musicals_db")

class Musical < ActiveRecord::Base
  has_many :songs

  # Returns a musical as a readable string
  def to_s
    # special case where the composer and lyricist are the same person
    return "\"#{title}\" (#{year}, #{composer})" if composer == lyricist

    # default case with a different composer & lyricist
    return "\"#{title}\" (#{year}, #{composer} & #{lyricist})"
  end
end

class Song < ActiveRecord::Base
  belongs_to :musical
end

Musical.delete_all

Musical.create([
  { title: "Cats", year: 1981, composer: "Andrew Lloyd Webber", lyricist: "T. S. Eliot" },
  { title: "Evita", year: 1976, composer: "Andrew Lloyd Webber", lyricist: "Tim Rice" },
  { title: "How to Succeed in Business", year: 1961, composer: "Frank Loesser", lyricist: "Frank Loesser" },
  { title: "The Sound of Music", composer: "Richard Rodgers", lyricist: "Oscar Hammerstein", year: 1959 },
  { title: "Les Miserables", composer: "Claude-Michel Schonberg", lyricist: "Herbert Kretzmer", year: 1985 },
  { title: "West Side Story", composer: "Leonard Bernstein", lyricist: "Stephen Sondheim", year: 1957 },
  { title: "Oklahoma", composer: "Richard Rodgers", lyricist: "Oscar Hammerstein", year: 1943 },
  { title: "Sweeney Todd", composer: "Stephen Sondheim", lyricist: "Stephen Sondheim", year: 1979 },
  { title: "Wicked", composer: "Stephen Schwartz", lyricist: "Stephen Schwartz", year: 2003 }
])

# Print all musicals
puts Musical.all
puts

# Find the first musical in the table
puts Musical.first
puts

# Find a musical by its title
puts Musical.find_by(title: "Cats")
puts

# Find all musicals composed by Richard Rodgers
puts Musical.where(composer: "Richard Rodgers")
puts

# Print all musicals, ordered by year (most recent to oldest)
puts Musical.order(year: :desc)
puts

# Final all musicals more recent than 1980
puts Musical.where("year > 1980")
puts

# A list of just the titles of the musicals
Musical.select(:title).each { |t| puts t.title }
puts
