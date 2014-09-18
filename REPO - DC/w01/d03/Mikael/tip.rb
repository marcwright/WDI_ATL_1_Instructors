def get_response(query)
  puts query
  return gets.chomp.to_f
end

def calculate_tip()
  price = get_response("How much did your meal cost?")
  tax = get_response("What is the tax percentage?")
  tip = get_response("What percentage would you like to tip?")

  total = price * (tax / 100) + price
  grand_total = total * (tip / 100) + total

  puts "Your total is $#{grand_total.round(2)}"
  return grand_total
end
