puts "Enter a character"
character = gets.chomp

puts "How many number of rows do you want in your pyramid?"
rows = gets.to_i

current_row = 0
max_width = 2 * rows + 1

while current_row < rows
  puts (character * ( 2 * current_row + 1)).center(max_width)
  current_row = current_row + 1
end


