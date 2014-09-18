### Air Conditioning

puts "What is the current temperature?"
curr_temp = gets.to_i
puts "Is the A/C functional? (y/n)"
ac_works = (gets.chomp.downcase == "y")
puts "What temperature do you wish it were?"
new_temp = gets.to_i

if ac_works
  if curr_temp > new_temp
    puts "Turn on the A/C Please"
  end
else
  if curr_temp > new_temp
    puts "Fix the A/C now!  It's hot!"
  else
    puts "Fix the A/C whenever you have the chance...  It's cool..."
  end
end
