


def to_eat(query)
  puts info
  answer = gets.chomp.to_f
  return answer
end

  bill = to_eat("How much was your meal?")
  tax_rate = to_eat("What is the Tax rate?")
  tax = tax_rate/100
  tip = to_eat("What tip percentage does the server deserve?")
  tip_total = (tip/100) * bill
  total = bill * (tax/100) + bill
 puts = "Your total is #{grand_total}"


