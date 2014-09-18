puts "What character do you want to make a triangle from?"
character = gets.chomp

puts "How many rows do you want your triangle to be?"
rows = gets.to_i

puts "Do you want your pyramid to be upside down?"
upside_down = gets.chomp.upcase
max_width = 2 * rows + 1

if upside_down == "NO"
  count = 0
  while count <= rows
    puts (character * (2 * count + 1)).center(max_width)
    count = count + 1
  end
else
  count = rows
  while count >= 0
    puts (character * (2 * count + 1)).center(max_width)
    count = count - 1
  end
end
