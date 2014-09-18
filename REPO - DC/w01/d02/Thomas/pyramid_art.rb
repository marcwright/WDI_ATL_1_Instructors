puts "submit a character"
puts "how many rows would you like in your pyramid"
character = gets.chomp
rows = gets.to_i

current_row = 0
max_width = 2 * rows + 1

while current_row <= rows 
puts (character * (2 * current_row + 1)).center(max_width)
current_row = current_row + 1
end