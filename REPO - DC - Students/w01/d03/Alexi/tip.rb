# def tip_calc(m_cost, m_tax, m_tip)
#   puts "Enter the price of your meal: "
#     price = gets.chomp
#   puts "Enter the local tax percentage: "
#     tax = gets.chomp.to_f
#   puts "How much would you like to tip?"
#     tip = gets.chomp_to.f
# end

# total = tip_calc()
# puts "Your total is $#{total}"

def get_response(query)
  puts query
  answer = gets.chomp.to_f
end

price = get_response("What\'s the price?")
tax = get_response("What\'s the tax?")
tip = get_response("What\'s the tip?")

total = price * (tax/100) + price
grand_total = total + (total * (tip / 100))
