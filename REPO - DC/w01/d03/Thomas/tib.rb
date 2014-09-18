# def get_response(query)
# 	puts query
# 	answer = gets.chomp.to_f
# 	return answer
# end

# price = get_reponse("What's the price?")
# tax = get_response("What's the tax?")
# tip = get_response("Wha's the tip?")

# total = price * (tax/100) + price
# grand_total = total * (tip/100) + total

# puts "Your total is #{grand_total,round(2)}"


def get_response(query)
	puts query
	answer = gets.chomp.to_f
	return answer
end

price = get_response("Whats the price?")

puts "What\'s the price?"
price = gets.chomp.to_f

puts "What\'s the tax?"
tax = gets.chomp.to_f

puts "What\'s the tip?"
tip = gets.chomp.to_f

total = price + price * (tax/100)
grand_total = total + total * (tip/100)