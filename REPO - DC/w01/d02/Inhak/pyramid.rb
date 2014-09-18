puts "what character do you want to make a triangle from?"
key = gets.chomp
puts "how many rows do you want your pyramid to be?"
rows = gets.to_i
drawn_rows = 0
puts "Do you want the pyramid to be upside down?(Y/n)"

upside_down = gets.chomp.downcase
max_width = 2 * rows + 1
new_width = 2 * rows + 1
puts "here's your pyramid!"

if upside_down == "n"
  while drawn_rows <= rows
    puts (key * (2*drawn_rows + 1)).center(max_width)
    drawn_rows += 1
  end

else
  while rows >= drawn_rows
    puts (key * new_width).center(max_width)
    new_width -= 2
    drawn_rows += 1
  end
end
