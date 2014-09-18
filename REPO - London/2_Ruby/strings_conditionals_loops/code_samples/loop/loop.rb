def ask_user
  gets.chomp.to_i
end


puts "what is 2 to the 4th power?"

value = ask_user

while value != 2**4
  print "nope... try again"
  value = ask_user
end

puts "yes!"
