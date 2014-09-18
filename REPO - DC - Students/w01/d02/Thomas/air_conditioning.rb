puts "What is the current temperature?"
temp = gets.to_i
#gets.to_i automatically chomps
puts "is the A/C functional?"
func = gets.chomp.downcase
puts "What temperature do you desire?"
desire = gets.to_i

if func == "yes" && temp > desire
	puts "Turn on the A/C Please"
elsif func == "no" && temp > desire
	puts "Fix the A/C now!  It's hot!"
elsif func == "no" 
	#&& temp < desire : can be removed as it is made redundant by the line above
	puts "Fix the A/C whenever you have the chance...  It's cool..."
else
	puts "Call the HVAC company to swap for a heater."
end

