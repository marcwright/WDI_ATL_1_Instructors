
# def total_meal_price(meal,tax_percentage,tip_percentage)
#   tax = meal * (tax_percentage * 0.01)
#   tip = meal * (tip_percentage * 0.01)
#   return meal + tax + tip
# end

# puts "What is the price of your meal?"
# meal = gets.to_f

# puts "What is the tax percentage?"
# tax_percentage = gets.to_f

# puts "What percent would you like to tip?"
# tip_percentage = gets.to_f

# puts "Your total price for this meal is $#{total_meal_price(meal,tax_percentage,tip_percentage)}"


def get_response(query)
  puts query
  return gets.to_f
end

price = get_response("What's the price?")
tax = get_response("What's the tax?")
tip = get_response("What's the tip?")

total = (price * (tax/100)) + price
grand_total = (total * (tip/100)) + total

puts "Your grand total is #{grand_total.round(2)}"
