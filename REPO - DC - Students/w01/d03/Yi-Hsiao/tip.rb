# ### Tip Calculator
# - This should be done in a new file called `tip.rb`
# - The user should be asked to enter the price of their meal
# - The user should be asked to enter what the tax percentage is
# - The user should be asked to enter what percentage they would like to tip
# * ^^^ **DEAREST STUDENTS: Ask yourselves, "Is this DRY?"** ^^^ Write and use a method to get responses!
# - After these three options have been entered, the user should see an appropriate displayed output with their total
#   - For example:
#   `Your total is $15.47`

def get_num question
  # ask a question with an expected positive numerical response
  # returns a Float

  puts question
  user_resp = gets.chomp

  # checks if user's response is a positive float, otherwise repeat the question
  if user_resp =~ /^[0-9]+(\.[0-9]+)?$/
    return user_resp.to_f
  else
    puts "Please enter a positive number.", ""
    get_num question
  end
end

def calc_fraction percentage, total
  # takes a percentage like 10% and calculates the fraction of the total
  total = percentage / 100 * total
end

def calc_check_total
  # asks the user for basic information: subtotal, tax percentage, and tip percentage

  subtotal = get_num "How much was your meal without taxes?"
  tax_pct = get_num "What is the tax percentage?"
  tip_pct = get_num "How much would you like to tip in percent?"

  tax_amt = calc_fraction tax_pct, subtotal
  tip_amt = calc_fraction tip_pct, subtotal

  check_total = subtotal + tax_amt + tip_amt
  return check_total
end

puts "#Your total is %0.2f" % calc_check_total
