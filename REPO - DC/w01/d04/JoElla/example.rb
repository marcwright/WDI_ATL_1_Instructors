require "pry"
shows = ["Girls", "Game of Thrones", "Silicon Valley", "Arrested Development", "Battlestar Galactica"]

# count = 0
# while count < shows.length
#   puts "I <3 #{shows[count].upcase}"
#   count += 1
# end

# shows.each do |title|
#   puts "I <3 #{title}"
#   end

hearted_shows = []

shows.each do |title|
  hearted_shows.push("I heart #{title}")
  puts hearted_shows
end

more_shows = shows.map do |title|
  "I heart #{title}"
end
binding.pry
