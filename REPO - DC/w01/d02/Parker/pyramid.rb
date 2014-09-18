puts "Let\'s make a pyramid! What character do you want to use?"
character = gets.chomp

puts "How many rows do you want?"
rows = gets.to_i

current_row  = 0
max_width = 2 * rows + 1

while current_row <= rows
	puts (character * (2 * current_row + 1)).center(max_width)
	current_row = current_row + 1

end