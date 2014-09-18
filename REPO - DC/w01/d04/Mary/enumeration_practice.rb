
shows = ["Girls", "Game of Thrones", "Silicon Valley", "Arrested Development", "Battlestar Galactica"]

#using .each requires you to make empty array
#always returns original array
feelings_toward_shows = []
shows.each do |show|
  feelings_toward_shows.push("I <3 #{show}!")
end
puts feelings_toward_shows

#same thing using .map and is more succinct
feelings_toward_shows = shows.map do |show|
  "I <3 #{show}"
end
