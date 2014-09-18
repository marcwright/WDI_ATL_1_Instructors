shows = ["Girls", "Game of Thrones", "Silicon Valley", "Arrested Development", "Battlestar Galactica"]

def loop_and_print(array)
  i = 0
  while i < array.length
    yield array[i]
    i += 1
  end
end

### The Block
# do |show|
#   puts "I <3 #{show}."
# end

### Calling the method with a block
# loop_and_print(shows) do |show|
#   puts "I <3 #{show}."
# end

#puts shows.each{|show| puts "I <3 #{show}."}

#Using .each
#return an array with ["I <3 Girls", "I <3 Game of Thrones", ...]
# shows_2 = []
# shows.each do |show|
#   shows_2.push("I <3 #{show}.")
# end

# puts shows_2

# shows_3 = shows.map do |show|
#   "I <3 #{show}."
# end

# numbers = [1,2,3,4,5,6,7,8,9,10]
# even_numbers = numbers.select do |number|
#   number.even?
# end

alpha = ["a", "b", "c", "d"]
