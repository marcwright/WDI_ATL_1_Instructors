require 'pry'

def drinking_age?(age)
	if age < 21
		puts "You can't drink yet...legally"
		return false
	else
		puts "Drinks Galore!"
		return true
	end
end

drinking_age? (19)
drinking_age? (23)

def is_prime?(num)
	factor = 2
	max_potential_factor = num / 2
	while factor <= max_potential_factor
		if (num % factor) == 0
			return false
		end
		factor =+ 1
	end
git
	return true
end

	if is_prime?(9)
		puts "This method breaks the world."
	else
		puts "it might still work"
end



# secret_number = rand(11)

# puts "Pick a number between 0 and 10"
# guess = gets.to_i

# while guess != secret_number
# 	if guess > secret_number
# 		puts "Too High"
# 	else
# 		puts "Too Low"
# 	end

# 	puts "Guess again dummy"
# 	guess = gets.to_i
# 	number_of_guesses = number number_of_guesses + 1 
# end

# puts "You win! HIGH FIVE! It only took you #{number_of_guesses} guesses"m




# # Methods

# Create a method for each of the following scenarios.

# ###1. Drinking age
# - Define a method `drinking_age?`that takes, as an argument, an age.
# - If the age is less than 21, print an appropriate message, then return `false`
# - If the age is over 21, print a different message, then return `true`

# ###2. Air Conditioning
# - Define a method `ac_action` that takes, as arguments, the current temperature, whether the A/C is functional or now, and the desired temperature .
#     - If the air conditioner is functional and the current temperture is above the the desired temperature... return the string "Turn on the A/C Please"
#     - If the air conditioner is non-functional and the current temperture is above the the desired temperature... return the string "Fix the A/C now!  It's hot!"
#     - If the air conditioner is non-functional and the current temperture is below the the desired temperature... return the string "Fix the A/C whenever you have the chance...  It's cool..."

# ###3.  Prime Numbers
# - Define a method `is_prime?` that takes, as an argument, an integer
# - If the number is prime, return `true`
# - If the number is not prime, return `false`
# - Make your method work at least for numbers from 1 - 25