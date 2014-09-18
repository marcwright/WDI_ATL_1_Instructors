require 'pry'

shows = ["Girls", "Game of Thrones", "Silicon Valley", "Arrested Development", "Battlestar Galactica"]

### Imperative Version
count = 0
while count < shows.length
  puts "I <3 #{shows[count].upcase}"
  count = count + 1
end

### Declaration Version

### Method Definition
def loop_and_print(array)
  i = 0
  while i < array.length
    yield array[i]
    i += 1
  end
end

### What The Block Looks like by itself
# do |show|
#   puts "I <3 #{show}"
# end

### Calling the method with a block
# loop_and_print(shows) do |show|
#   puts "I <3 #{show}"
# end

shows.each do |show| 
  puts "I <3 #{show}" 
end

#---

#return an array with ["I <3 Girls", "I <3 Game of Thrones", ...]

# #Using .each
# feelings_toward_shows = []
# shows.each do |show|
#   feelings_toward_shows.push("I <3 #{show}")
# end

# # Use .map
# feelings_toward_shows = shows.map do |show|
#   "I <3 #{show}"
#   "The Nanny"
# end

### Looking at scope
# name = "Joella"
# shows.each do |show|
#   puts name
# end

### Select
# numbers = [1,2,3,4,5,6,7,8,9,10]
# even_numbers = numbers.select do |number|
#   number.even?
# end



binding.pry