def answer_to(question)
  puts question
  answer = gets.chomp.to_f
  return answer
end

cost = answer_to("How much (excluding tax) did your meal cost?")
tax = answer_to("What is the tax percentage?")
tip = answer_to("What percentage would you like to tip?")

total = (1+tip/100)*((1 + tax/100)*cost)

puts "Your total is $#{total}."
