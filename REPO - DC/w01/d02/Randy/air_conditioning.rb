puts "What's the current temp?"
temp = gets.to_i
puts "Does the A/C work? (yes/no)"
answer = gets.chomp.downcase
puts "What temp would you like it to be?"
desired = gets.to_i
if answer == 'yes' && temp > desired
	puts "Turn on the A/C please."
elsif answer == 'no' && temp > desired
	puts "Fix the A/C now!  It's hot!"
elsif answer == 'no'
	puts "Fix the A/C whenever you have the chance...  It's cool..."
else 
	puts "A/C can't help you there buddy."
	#Added else to prevent throwing an error when specific conditions not met.
end
