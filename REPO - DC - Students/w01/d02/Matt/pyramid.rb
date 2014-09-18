puts "What character for your pyramid?\n"
char = gets.chomp.upcase

puts "How many rows?"
rows = gets.to_i

current_row = 0
max_width = 2 * rows + 1

while current_row <= rows
  puts (char * (2 * current_row + 1)).center(max_width)
  current_row = current_row + 1
end

puts "Would you like to flip it (Y/N)"
flip = gets.chomp.downcase

while flip = "y"
  puts (char * (2 * current_row - 1)).center(max_width)
  current_row = current_row - 1
end

