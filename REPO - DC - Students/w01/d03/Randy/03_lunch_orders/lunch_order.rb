
# response = ""
# counter = 0
# orders = {}
# foods = []


# 	while response != "n" && counter == 0
# 		puts "What is your name?"
# 		name = gets.chomp
# 		name = name.to_sym
# 		puts "What would you like to eat?"
# 		foods_order = gets.chomp
# 		foods = foods.push(foods_order)
# 		orders[:name] = foods
# 		puts "**Add another item to the order? (y/n)"
# 		response = gets.chomp.downcase
# 	end
# 	puts "#{name} ordered #{foods.join(", ")}"

orders = {}

	while true

		puts "Name for order:"
		name = gets.chomp

		puts "#{name} wants to order:"
		order = gets.chomp

			if !orders.has_key?(name)    #If the hash orders DOES NOT have key called "Whatever the neame entered was,
				orders[name] = []        #then we will assign the key and set it to a value that is an empty array.
			end

		orders[name].push(order)

		puts "Add another item to the order? (y/n)"
		break if !gets.index('y')
	end
 
	puts orders
	

