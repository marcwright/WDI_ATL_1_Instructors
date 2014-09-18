puts "What is the current temperature?"
temp = gets.to_i
puts "Is the A/C functional? Y/N"
working = gets.chomp.upcase
puts "What temperature do you wish it was?"
wish_temp = gets.to_i

if working == "YES" && temp > wish_temp
  puts "Turn on the A/C please"
elsif working == "NO" && temp > wish_temp
  puts "Fix the A/C now!  It's hot!"
elsif working == "NO"
  puts "Fix the A/C whenever you have the chance...  It's cool..."
end
