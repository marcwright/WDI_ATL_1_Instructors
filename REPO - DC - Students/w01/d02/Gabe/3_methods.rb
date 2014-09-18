
require 'prime'

def drinking_age?(age)

	if age > 21
		return "you can drink!"
	else
		return "you cannot drink."
	end
end

drink = drinking_age?(90)
print drink

def ac_action(functional, curr_temp, ideal_temp)


	if functional == "y" && curr_temp > ideal_temp
		return "Turn on the A/C please."

	elsif functional == "n" && curr_temp > ideal_temp
		return "Fix the A/C now! It's hot!"

	elsif functional == "n" && curr_temp < ideal_temp
		return "Fix the A/C whenever... its cool."

	else
		return "great."
	end
	

end

ac = ac_action("y", 77, 65)
print ac


def is_prime?(num)
	factor = 2
	max_factor = num / 2
	while factor <= max_factor
		if (num % factor) == 0
			return false
		end
		factor += 1
	end

	return true
end

nine = is_prime?(9)
print nine


