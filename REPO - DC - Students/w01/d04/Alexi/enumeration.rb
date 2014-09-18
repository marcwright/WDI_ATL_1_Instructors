require 'pry'

shows = ["Girls", "Game of Thrones", "Silicon Valley", "Arrested Development", "Battlestar Galactica"]


# Imperative Version
count = 0
while count < shows.length
  puts "I <3 #{shows[count].upcase}"
  count = count + 1
end


# Method defnition
def loop_and_print(array)
  i = 0
  while i < array.length
    yield array[i]
    i += 1
  end

# Example of Block
# do |show|
#   puts "I <3 show"
# end

# Calling the block method
loop_and_print(shows) do |show|
  puts "I <3 #{show}"
end

### .each Method

shows.each do |show| 
  puts "I <3 #{show}"
end


#Using .each return an array with ["I <3 Girls", "I <3 GoT".....]
# Use .each when you don't need another copy
feelings_toward_shows = []
shows.each do |show|
  feelings_toward_shows.push("I <3 #{show}")
end

#Using .map --> Good for making copies. Filters and transforms data.
feelings_toward_shows = shows.map do |show| "I <3 #{show}"
end

name = "Joella"
shows.each do |show|
  puts name
end

numbers = [1,2,3,4,5,6,7,8,9,10]

even_numbers = numbers.select do |number|
  number.even?
end

