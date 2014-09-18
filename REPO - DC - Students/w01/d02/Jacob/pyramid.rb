puts "Which character would you like to use to create your pyramid?"
character = gets.chomp
puts "How many rows would you like your pyramid to consist of?"
rows = gets.to_i

count = 0
max_width = 2 * rows + 1


while count <= rows
  puts (character * (2 * count + 1)).center(max_width)
  count += 1
end
