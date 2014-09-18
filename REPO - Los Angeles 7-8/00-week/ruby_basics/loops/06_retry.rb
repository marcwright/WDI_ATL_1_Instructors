# Ruby retry Statement:
# Syntax:
	retry
# If retry appears in rescue clause of begin expression, restart from the beginning of the 1begin body.

	begin
	   do_something # exception raised
	rescue
	   # handles error
	   retry  # restart from beginning
	end
# If retry appears in the iterator, the block, or the body of the for expression, restarts the invocation of the iterator call. Arguments to the iterator is re-evaluated.

	for i in 1..5
	   retry if some_condition # restart from i == 1
	end

# Example:

	for i in 1..5
	   retry if  i > 2
	   puts "Value of local variable is #{i}"
	end