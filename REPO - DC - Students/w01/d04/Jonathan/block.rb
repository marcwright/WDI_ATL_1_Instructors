shows = ["Girls", "Game of Thrones", "Silicon Valley", "Arrested Development", "Battlestar Galactice"]
other_shows = ["Mad Men", "Breaking Bad", "Seinfeld", "The Walking Dead", "The Simpsons"]

### Imperative Version
count = 0
while count < shows.length
  puts "I <3 #{shows[count].upcase}"
  count = count + 1
end

### Method =================================
def loup_and_print(array)
  i = 0
  while i < array.length
    yield array[i]
end

### Calling the method with a block ========
loup_and_print(shows) do |show|
  puts "I <3 #{show}"
end

### .each ==================================
shows.each do |show|
  puts "I <3 #{show}"
end

["I <3 Girls", "I <3 Game of Thrones"]

shows.each do |show|

mapped_shows = []
mapped_shows = shows.map do |show|
  puts "I <3 #{show}"
end

### .map ===================================
mapped_shows = []
mapped_shows = shows.map do |show|
  puts "I <3 #{show}"
  puts "I REALLY LOVE #{other_shows}"
end

numbers = [1,2,3,4,5,6,7,8,9,10]
even_numbers = numbers.select do |number|
  number.even?
end
