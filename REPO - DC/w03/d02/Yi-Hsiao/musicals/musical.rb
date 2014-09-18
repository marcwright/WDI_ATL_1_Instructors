require "pg"
require "active_record"

# logs SQL commands to standard output
# ActiveRecord::Base.logger = Logger.new(STDOUT)

# creates a DB connection
ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  host: "localhost",
  username: "yihsiaol",
  database: "musicals_db"
)

class Musical < ActiveRecord::Base

  def self.find_title(title)
    self.find_by(title: title)
  end
end

# Return all musicals
puts "All musicals:"
Musical.all.each { |musical| puts "- #{ musical.title }" }

# Find the first musical in the table
puts "", "First musical in the table:", "- #{ Musical.first.title }"

# Find a musical by its title
puts "", "The composer of Les Miserables:", "#{ Musical.find_title("Les Miserables").composer }"

# Find all musicals composed by Richard Rodgers
puts "", "All musicals composed by Richard Rodgers:"
Musical.where(composer: "Richard Rodgers").find_each do |musical|
  puts "- #{ musical.title }"
end

# Order the musicals by year
puts "", "Musicals sorted by oldest to most recent:"
Musical.order(:year).all.each do |musical|
  puts "- #{ musical.title }"
end

# Final all musicals more recent than 1980
puts "", "Musicals more recent than 1980:"
Musical.where("year > 1980").all.each do |musical|
  puts "- #{ musical.title }"
end
