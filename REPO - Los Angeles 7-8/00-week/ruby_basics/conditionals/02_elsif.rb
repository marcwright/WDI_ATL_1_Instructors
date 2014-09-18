# Introducing elsif

		my_number = 400

		if my_number < 12
		  puts "Fewer than a dozen"
		elsif my_number < 64
		  puts "You could hold me in 6 bits"
		else
		  puts "That's a pretty big number"
		end

		# Output:
  		# You could hold me in 6 bits
  
# NOTICE Ruby uses elsif, not 'else if' and not 'elif'.

# Now we started with an if...else statement but let me show you something...

# >> That's a pretty big number