total_amount = 0

puts "What was the price of your meal? ($--.--)"
meal_cost = gets.delete("$").to_f

puts "What is the tax percentage? (--%)"
tax_percent = gets.delete("%").to_f

puts "What percentage tip would you like to pay? (--%)"
tip_percent = gets.delete("%").to_f

def tip_calculator(meal_cost, tax_percent, tip_percent)
  total_amount = (meal_cost * (1 + tax_percent / 100)) * (1 + tip_percent / 100)
  return total_amount
end

total_amount = tip_calculator(meal_cost, tax_percent, tip_percent)

puts "Your total is: $#{total_amount.round(2)}"

