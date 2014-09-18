def get_response(query)
  puts query
  answer = gets.chomp.to_f
  return answer
end

price = get_response("What's the price?")
tax = get_response("What's the tax?")
tip = get_response("What's the tip")

total = price * (tax/100) + price
grand_total = total * (tip/100) + total

puts "Your total is #{grand_total.round(2)}"
