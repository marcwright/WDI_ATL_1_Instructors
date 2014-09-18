puts "We are going to make an ASCII triangle. What character would you like to use?"
character = gets.chomp

puts "How many rows would you like?"
rows = gets.to_i


# puts user_character
# counter = user_rows - (user_rows - 1)

# while counter != user_rows
#   puts user_character * counter
#   counter = user_rows - (user_rows - 1)
# end

current_row = 0
max_width = 2 * rows + 1

while current_row <= rows
  puts (character * (2 * current_row + 1)).center(max_width)
  current_row = current_row + 1
end
