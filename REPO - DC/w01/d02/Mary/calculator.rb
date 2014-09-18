puts "Please choose from menu:"
  puts "ADD   SUBSTRACT   MULTIPLY   DIVIDE   FIND EXPONENT   FIND SQUARE ROOT"
  operation = gets.chomp.upcase

while operation != "N"

  puts "Please enter the first value you'd like to use in calculation."
  val1 = gets.to_i
  puts "Please enter the second value you'd like to use in calculation. If calculating square root, just press enter."
  val2 = gets.to_i

  if operation == "ADD"
    puts "Answer is " + (val1 + val2).to_s
  elsif operation == "SUBTRACT"
    puts "Answer is " + (val1 - val2).to_s
  elsif operation == "MULTIPLY"
    puts "Answer is " + (val1 * val2).to_s
  elsif operation == "DIVIDE"
    puts "Answer is " + (val1 / val2).to_s
  elsif operation == "FIND EXPONENT"
    puts "Answer is " + (val1 ** val2).to_s
  elsif operation == "FIND SQUARE ROOT"
    puts "Answer is " + Math.sqrt(val1).to_s
  end

  puts "Please choose from menu or type \"N\" to quit:"
  puts "ADD   SUBSTRACT   MULTIPLY   DIVIDE   FIND EXPONENT   FIND SQUARE ROOT"
  operation = gets.chomp.upcase
end
