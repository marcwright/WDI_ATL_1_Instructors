
def tPrice (price, tax, tip)
  tot_price = (price + (price * (tax/100)) + (price * (tip/100))).round(2)
  return tot_price
end


puts "What is the price of your meal?"
price = gets.to_f

puts "What is your tax percentage?"
tax = gets.to_f

puts "What percent would you like to tip?"
tip = gets.to_f

puts "Your total price is: $#{tPrice(price, tax, tip)}"
