# # Methods

# Create a method for each of the following scenarios.

# ###1. Drinking age
# - Define a method `drinking_age?`that takes, as an argument, an age.
# - If the age is less than 21, print an appropriate message, then return `false`
# - If the age is over 21, print a different message, then return `true`
def drinking_age? age
  can_drink = age >= 21
  puts "Let's go drink #{can_drink ? "beer" : "chocolate milk"} after class."
  return can_drink
end

# ###2. Air Conditioning
# - Define a method `ac_action` that takes, as arguments, the current temperature, whether the A/C is functional or now, and the desired temperature .
#     - If the air conditioner is functional and the current temperture is above the the desired temperature... return the string "Turn on the A/C Please"
#     - If the air conditioner is non-functional and the current temperture is above the the desired temperature... return the string "Fix the A/C now!  It's hot!"
#     - If the air conditioner is non-functional and the current temperture is below the the desired temperature... return the string "Fix the A/C whenever you have the chance...  It's cool..."
def ac_action curr_temp, working_ac, desired_temp
  is_hot = curr_temp > desired_temp
  if is_hot
    working_ac ? "Turn on the A/C please." : "Fix the A/C now! It's hot!"
  else
    working_ac ? "Everything is hunky dory." : "Fix the A/C whenever you have the chance... It's cool..."
  end
end

# ###3.  Prime Numbers
# - Define a method `is_prime?` that takes, as an argument, an integer
# - If the number is prime, return `true`
# - If the number is not prime, return `false`
# - Make your method work at least for numbers from 1 - 25
def is_prime? int
  return false if int < 2
  int.is_a? Integer ? (2..int - 1).none? { |i| int % i == 0 } : false
end
