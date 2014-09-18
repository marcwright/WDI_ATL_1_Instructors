puts "What is the temperature?"
temp = gets.to_i
puts "Is the A/C working? yes or no"
work = gets.chomp.downcase
puts "What temperature (in F) do you wish it were?"
ideal_temp = gets.to_i

if work == "yes" && temp > ideal_temp
  puts "Turn on the A/C Please."
elsif work == "no" && temp > ideal_temp
  puts "Fix the A/C NOW! It's HOT!"
else #work == "no" && temp < ideal_temp
  puts "Fix the A/C whenever you have a chance...It's cool."
end



