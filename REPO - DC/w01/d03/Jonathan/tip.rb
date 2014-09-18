# puts "What was the total on your bill?"
# total = gets.chomp

# puts "What is the percent of tax"
# percent = gets.chomp.to_f

# puts "How much money would you like to leave?"
# tip = gets.chomp.to_f

def get_response(query)
  puts query
  answer = gets.chomp.to_f
  return answer
end

price = get_response
percent = get_response
tip = get_response

total = price * (tax/100) + price
grand_total = "Your total is: #{grand_total.round(2)}
