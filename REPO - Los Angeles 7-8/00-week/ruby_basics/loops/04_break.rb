# BREAK and NEXT
# now this one is complicated...

# Syntax 
#	break

# Terminates the most internal loop. Terminates a method with an associated block if called within the block (with the method returning nil).

	for i in 0..5
	   if i > 2 then
	      break
	   end
	   puts "Value of local variable is #{i}"
	end

	# OUTPUT
	#	Value of local variable is 0
	#   Value of local variable is 1
	#   Value of local variable is 2

# Syntax
#	next

# Jumps to next iteration of the most internal loop. Terminates execution of a block if called within a block

	for i in 0..5
	   if i < 2 then
	      next
	   end
	   puts "Value of local variable is #{i}"
	end

	# OUTPUT
	# 	Value of local variable is 2
	# 	Value of local variable is 3
	# 	Value of local variable is 4
	# 	Value of local variable is 5