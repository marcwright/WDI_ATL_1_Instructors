# Tip Calculator

def tip_calc(meal_price)
  puts "How much was your meal before tax?"
  meal_price = gets.to_f

  puts "How much is tax?"
  tax_per = gets.to_f

  puts "What percentage would you like to tip?"
  tip_per = gets.to_f

  if tax_per > 0
    meal_price_plus_tax = meal_price + (meal_price * tax_per)
  else
    meal_price_plus_tax = meal_price
  end

  if tip_per > 0
    meal_price_tip = (meal_price_plus_tax * tip_per)
  else
    meal_price_tip = 0
  end
  meal_price_plus_tip = meal_price_tip + meal_price_plus_tax

  puts "You should tip #{meal_price_tip}"
  puts "Your total bill would be #{meal_price_plus_tip}"
  return
end

puts "Would you like to calculate a tip?"
meal = gets.to_f
tip_calc(meal)
