# Ruby case statement

# Syntax:
#		case expression
#		[when expression [, expression ...] [then]
#		   code ]...
#		[else
#		   code ]
#		end

# So case goes hunting, and if none of the -when- clauses match, then the -else- clause is executed

		# case x
		# when 1,2,3
		#   puts "1, 2, or 3"
		# when 10
		#   puts "10"
		# else
		#   puts "Some other number"
		# end

# Example demo

		# let's set a variable x to 10
		x = 30
		case x
		when 1,2,3
		  puts "1, 2, or 3"
		when 10
		  puts "10"
		else
		  puts "Some other number"
		end

# What happens when I hit option+shift+u ? 

# >> Some other number