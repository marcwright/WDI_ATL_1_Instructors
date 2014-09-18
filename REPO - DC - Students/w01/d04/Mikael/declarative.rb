require 'pry'
shows = ["Girls", "Game of Thrones", "Silicon Valley", "Arrested Development", "Battlestar Galactica"]
=begin
count = 0
while count < shows.length
  puts "I <3 #{shows[count].upcase}"
  count += 1
end
=end

def loop_and_print(array)
  i = 0
  while i < array.length
    yield array[i]
    i += 1
  end
end

### The Block
# do |show|
#   puts "I <3 #{show}"
# end

## Calling the method with a Block ##
=begin
loop_and_print(shows) do |show|
  puts "I <3 #{show}"
end
=end

shows.each do |show|
  puts "I <3 #{show}"
end

# new_array = []
new_array = shows.each do |show|
  "I <3 #{show}"
end

new_array2 = shows.map do |show|
  "I <3 #{show}"
end

## Looking at scope
name = "Joella"
shows.each do |show|
  puts name
end

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
even_numbers = numbers.select do |number|
  number.even?
end

binding.pry
