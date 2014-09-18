# def drinking_age?(age)
# 	if age < 21
# 		puts "No booze for you!"
# 		return false
# 	else
# 		puts "Grab a drink"
# 		return true
# 	end
# end

# def ac_action(current_temp, ac_funct, desired_temp)
# 	if ac_funct.downcase == "yes" && current_temp > desired_temp
# 		return "Turn on the A/C Please"
# 	elsif ac_funct.downcase == "no" && current_temp > desired_temp
#     	return "Fix the A/C now!  It's hot!"
#     elsif ac_funct.downcase == "no" && current_temp < desired_temp
#     	return "Fix the A/C whenever you have the chance...  It's cool..."
#     end
# end

require 'pry'
def is_prime?(num)
	if num.to_i == 1 || num.to_i == 0
		return false
	end
  factor = 2
  max_potential_factor = num / 2
    while factor <= max_potential_factor
    if num % factor == 0
      return false
  	end
    factor += 1
end
  return true
end
binding.pry