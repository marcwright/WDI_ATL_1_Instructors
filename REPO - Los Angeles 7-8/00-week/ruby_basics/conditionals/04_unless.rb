# The Ruby Unless modifier
# "unless" is also what is called a 'statement modifier' in Ruby

# Syntax: 
#(put a hash # in front of the next line if you want to run alt+shift+u)

	#	code unless conditional

# Executes code if conditional is false.

# Example:
		$var =  false

		puts "I'm a one line statement" unless $var

		# Output
		# I'm a one line statement

# Ruby Unless statement

# Syntax:
#(put hashes # in front of the next block of code if you want to run alt+shift+u)

		unless conditional [then]
		   code
		[else
		   code ]
		end

# Executes code if conditional is false. If the conditional is true, code specified in the else clause is executed.

		unless true
			puts "nope, it's not true"
		else
			puts "yep, it's true"
		end

		# Output
		# yep, it's true

