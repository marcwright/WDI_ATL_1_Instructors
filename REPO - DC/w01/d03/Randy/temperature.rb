def convert_to_farenheit(temp)
	return ((temp*9)/5)+32
end

def convert_to_kelvin(temp)
	return temp+273
end
 
 puts "What's the temp?"
 temp = gets.to_i

 convert_to_farenheit(temp)
 puts "#{temp} in Farentheight is #{convert_to_farenheit(temp)}"

 convert_to_kelvin(temp)
 puts "#{temp} in Kelvin is #{convert_to_kelvin(temp)}"

#def convert(initial_scale, deisred_scale)
	puts "What temp would you like to convert?"
	temp = gets.to_i
