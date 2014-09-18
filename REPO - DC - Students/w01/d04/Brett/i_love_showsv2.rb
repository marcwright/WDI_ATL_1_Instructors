shows = ["Girls", "Game of Thrones", "Silicon Valley", "Arrested Development", "Battlestar Galactica"]

feelings_toward_shows = []

shows.each do |show|
  feelings_toward_shows.push("I <3 #{show}")
end

i_love_shows = shows.map { |show| "I <3 #{show}" }
puts i_love_shows

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
even_numbers = numbers.select { |number| number.even? }
puts even_numbers
