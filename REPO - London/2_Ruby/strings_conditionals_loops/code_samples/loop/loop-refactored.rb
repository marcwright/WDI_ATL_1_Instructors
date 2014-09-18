def warn_user
  print "nope... try again: "
end

puts "what is 2 to the 4th power?"

value = gets.chomp.to_i
while value != 2**4
  warn_user
  value = gets.chomp.to_i
end

puts "yes!"

