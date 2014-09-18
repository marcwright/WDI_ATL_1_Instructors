<<<<<<< HEAD
puts "What is the current temperature?"
temperature = gets.to_i
puts "Is the AC currently working?"
ac_working = gets.chomp.downcase
puts "What temperatrue do you wish it was?"
ideal_temperature = gets.to_i 

if ac_working == "yes" && temperatrue > ideal_temperature
	puts "Turn on the AC please!"
elsif ac_working == "no" && temperatrue > ideal_temperature
	puts "Fix the AC! I am really hot!"
elsif ac_working == "no"
	puts "Fix the ac whenevs. It\'s cool"
else 
	puts "It is really chilly. Maybe we should light a fire"
end

=======
puts "What is the current temp?"
user_input = gets.to_i
puts "Is the A/C functional? (Answer y or n)"
user_input2 = gets.chomp.downcase
puts "What temp do you wish it was?"
user_input3 = gets.to_i

if user_input2 == "y" && user_input >= user_input3
  puts "Turn on the A/C please"
elsif user_input2 == "n" && user_input >= user_input3
  puts "Fix the A/C"
else
  puts "Fix A/C when you have a minute."
end
>>>>>>> cc5a9233c374ddd7aa711dec1c6f5cc1cad8c0d5
