puts "What is the current temp?"
current_temp = gets.to_i

puts "Is the A/C working? (Y/N)"
ac_status = gets.chomp.downcase

puts "What is your ideal temp?"
ideal_temp = gets.to_i

if ac_status == "y" && current_temp > ideal_temp
  puts "Turn on AC"
elsif ac_status == "n" && current_temp > ideal_temp
  puts "fix AC now"
else
  puts "fix AC soon"
end
