
def get_answer(query)
 puts query
 answer = gets.to_f
 return answer
end

meal_cost = get_answer("How much was that meal?")
tax_rate = get_answer("What is the tax rate")
tip_pct = get_answer("What percent do you want to tip?")


 def find_tax(meal, tax)
  tax = (tax / 100) * meal
  return tax
end

tax_amt = find_tax(meal_cost, tax_rate)

def find_tip(meal, tip)
  tip = (tip / 100) * meal
  return tip
end

tip_amt = find_tip(meal_cost, tip_pct)

puts "The total cost is #{tax_amt + tip_amt + meal_cost}"





