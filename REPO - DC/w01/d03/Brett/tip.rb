 def total(price, tax, tip)
   return (price * (tip / 100)) + price + (price * (tax / 100))
 end

# puts "What is the price of your meal?"
# price = gets.to_f

# puts "What is the percent tax?"
# tax = gets.to_f / 100

# puts "What percentage would you like to tip?"
# tip = gets.to_f / 100



def get_response(query)
  puts query
  answer = gets.to_f
  return answer
end

price = get_response("What is the price of your meal?")
tax = get_response("What is the tax percentage?")
tip = get_response("What percentage would you like to tip?")

puts "Your total bill is $#{total(price, tax, tip)}"
