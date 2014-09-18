puts "Enter a character."
char = gets.chomp
puts "How many rows would you like in your pyramid?"
rows = gets.to_i
puts "Would you like it to be upside down? (y/n)"
topsy = gets.chomp.downcase
count = 1

if topsy == "y"
  while count <= rows
    puts char * (rows - (count + 2))
    count += 1
  end
elsif topsy == "n"
  while count <= rows
    puts char * (count + 2)
    count += 1
  end
end

=begin
puts "Let\'s make a sweet pyramid! What character do you want to use?"
character = gets.chomp

puts "How many rows do you want?"
rows = gets.to_i

current_row = 0
max_width = 2 * rows + 1

while current_row <= rows
  puts (character * (2 * current_row + 1)).center(max_width)
  current_row = current_row + 1
end
=end
