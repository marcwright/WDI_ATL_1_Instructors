require 'pry'

def drinking_age?(age)
	if age < 21
		puts "You are too young to drink."
		return false
	else
		puts "You can legally drink."
		return true
	end
end

drinking_age?(19)
drinking_age?(23)

def ac_action(current_temp, ac_functional, desired_temp)
	if ac_functional == "yes" && current_temp > desired_temp
		puts "Turn on the A/C please"
	elsif ac_functional == "no" && current_temp > desired_temp
		puts "Fix the A/C now! It's hot!"
	elsif ac_functional == "no" && current_temp < desired_temp
		puts "Fix the A/C whenever you have the chance... It's cool..."
	else
    puts "All is well."
	end
end

var1 = ac_action(70, "yes", 68)
var2 = ac_action(68, "no", 72)
var3 = ac_action(80, "no", 74)

binding.pry

def is_prime?(integer)
  factor = 2
  max_pot_factor = integer / 2
  while factor <= max_pot_factor
    if (integer % factor) == 0
      return false
    end
  factor +=1
end

var5 = is_prime?(23)
var6 = is_prime?(18)

binding.pry

