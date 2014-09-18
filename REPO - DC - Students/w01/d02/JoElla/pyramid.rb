puts "Let's make a pyramid.  What character should we use?"
char = gets.chomp

puts "How many rows do you want?"
rows = gets.to_i

current_row = 0

max_width = 2 * rows + 1

while current_row < rows
  puts (char * (2 * current_row + 1)).center(max_width)
  current_row += 1
end
