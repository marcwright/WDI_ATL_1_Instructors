print "What character do you want to use? "
char = gets.chomp.chars.first
print "How many rows? "
num_rows = gets.to_i
row = 0

while row < num_rows
  (num_rows - row - 1).times { print " " }
  (row * 2 + 1).times { print char }
  puts ""
  row += 1
end
