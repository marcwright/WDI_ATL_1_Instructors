def get_number
  return gets.to_f
end

puts "TIP CALCULATOR!!! How much was your meal?"
meal_price = get_number
puts "What is the tax percentage on the meal?"
tax = get_number
puts "What percent tip do you want to leave (15% - 20% is appropriate)"
tip_perc = get_number


suggested_tip = (tip_perc/100) * meal_price
tax_amount = (tax/100) * meal_price
total = suggested_tip + meal_price + tax_amount

puts "Your total is $#{total}"
