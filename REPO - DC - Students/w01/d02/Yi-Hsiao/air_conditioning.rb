### Air Conditioning
# - This should be done in a new file called air_conditioning.rb
# - Ask the user what the current temperature is, if the A/C is functional, and what temperature they wish it was.
# - If the airconditioner is functional and the current temperature is above the the desired temperature... display "Turn on the A/C Please"
# - If the airconditioner is non-functional and the current temperature is above the the desired temperature... display "Fix the A/C now!  It's hot!"
# - If the airconditioner is non-functional and the current temperature is below the the desired temperature... display "Fix the A/C whenever you have the chance...  It's cool..."

def get_temp prompt
  # prompts a user for a temperature
  # expects a numeric response
  # repeat question if user enters wrong input
  # return the Float of the user's input

  puts prompt
  response = gets.chomp
  if response =~ /^-*[0-9]+(\.[0-9])*$/
    response.to_f
  else
    puts "Sorry, I didn't understand you."
    get_temp prompt
  end
end

def ac_works?
  # asks a user if the ac is working
  # expects a y/n response
  # repeats question if user enters an unexpected value

  acceptable_answers = ["Y", "N"]

  puts "Is the A/C functional (Y/N)?"
  response = gets.chomp.upcase

  if acceptable_answers.include? response
    response == "Y" ? true : false
  else
    puts "Sorry, I didn't understand you."
    ac_works?
  end
end

def check_ac
  # checks what we need to do with the ac based on 3 factors
  # 1. the current temp
  # 2. the target temp
  # 3. is the ac working or not?

  current_temp = get_temp "What's the current temperature?"
  working_ac = ac_works?

  target_temp = get_temp "What do you want the temperature to be?"
  hot_in_here = current_temp > target_temp


  if hot_in_here
    working_ac ? "Turn on the A/C Please" : "Fix the A/C now!  It's hot!"
  else
    working_ac ? "It's cool enough here already." : "Fix the A/C whenever you have the chance...  It's cool..."
  end
end

puts check_ac
