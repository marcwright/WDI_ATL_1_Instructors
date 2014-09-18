# So Ruby while loop syntax  looks like so

	# while conditional [do]
	#    code
	# end

# Example

	$i = 0
	$num = 5

	while $i < $num  do
	   puts("Inside the loop i = #$i" )
	   $i +=1
	end

# >> Inside the loop i = 0
# >> Inside the loop i = 1
# >> Inside the loop i = 2
# >> Inside the loop i = 3
# >> Inside the loop i = 4