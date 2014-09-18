puts "Let\'s make a pyramid, what character would you like to use?"
user_char = gets.chomp
puts "How many rows would you like your pyramid to be?"
user_rows = gets.to_i

current_row = 0
max_width = 2 * user_rows + 1

while current_row <= user_rows
  puts (user_char * (2 * current_row +1)).center(max_width)
  current_row = current_row + 1
end

# puts user_char.center (3) * user_rows



