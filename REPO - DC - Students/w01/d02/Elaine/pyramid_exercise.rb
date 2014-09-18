puts "Let's make a pyramid. Enter a character:"
character = gets.chomp

puts "How many rows do you want your triangle to be?"
number_rows = gets.to_i

puts "Here's your pyramid!"


current_row = 0
max_width = 2 * number_rows + 1

while current_row <= number_rows
	puts (character * (2 * current_row + 1)).center(max_width)
	current_row += 1
end

