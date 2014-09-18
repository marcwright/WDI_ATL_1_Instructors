puts "Is the Air Conditioner functional?"

	functional = gets.chomp.downcase

puts "1) What is the current temperature, in degrees Fahrenheit?"

	curr_temp = gets.chomp.to_f

puts "2) What temperature would you like it to be in here? (In degrees F)"

	ideal_temp = gets.chomp.to_f


case functional

when "yes" || "yep" || "it is" || "maybe" || "i think so" || "affirmative"

		if curr_temp > ideal_temp
			puts "Turn on the AC. We must lower the temp #{curr_temp - ideal_temp} degrees F."
		else 
			puts "Great."
		end

when "no" || "nope" || "negative"
	
	if curr_temp > ideal_temp
		puts "Get that AC fixed! Its #{curr_temp - ideal_temp} degrees too HOT!!!"
	
	else
	puts "Maybe get the AC fixed. You may desire it be be cooler in here someday."

	end

end
