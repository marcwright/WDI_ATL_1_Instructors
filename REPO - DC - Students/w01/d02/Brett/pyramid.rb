puts "What character do you want to build a pyramid with?"
character = gets.chomp

puts "How many rows high should the pyramid be?"
rows = gets.to_i

puts "Do you want it upside down? (y/n)"
upside_down = gets.chomp.downcase

rows_built = 0
max_width = 2 * rows + 1
while rows_built <= rows
  if upside_down == "y"
   while rows > 1
    puts "#{character * (2 * rows + 1)}".center(max_width)
    rows -= 1
  end

  else
  end

  puts "#{character * (2 * rows_built + 1)}".center(max_width)
  rows_built += 1

end
