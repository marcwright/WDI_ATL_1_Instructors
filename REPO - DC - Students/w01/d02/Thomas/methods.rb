require "pry"

#drinking age

def drinking_age?(age.to_i)
  puts "sorry, you are underage" if age < 21
  return false
  puts "you are of legal age" if age >= 21
  return true
end

drinking_age?(19)
drinking_age?(23)

#A/C unit

def ac_action(temp, func, desire)
  if func == true && temp > desire 
  return "Turn on the A/C Please"
elsif func == false && temp > desire
  return "Fix the A/C now!  It's hot!"
else
	return "Fix the A/C whenever you have the chance...  It's cool..."
end


#is_prime?

def is_prime?(num.to_i)
  while num % 
	end