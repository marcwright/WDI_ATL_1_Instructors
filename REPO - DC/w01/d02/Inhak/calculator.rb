in_operation = true
last_num = nil

while in_operation == true
  puts "LA CALCULATRICE: what would you like to do?"
  puts "add, subtract, multiply, divide, exponent, sqrt, trig, factorial, quit"
  user_command = gets.chomp.downcase

  case user_command
  when "add"
    puts "number to add"
    num1 = gets.to_f
    puts "#{num1} + __"
    num2 = gets.to_f
    last_num = num1 + num2
    puts last_num
  when "subtract"
    puts "number to subtact from"
    num1 = gets.to_f
    puts "#{num1} - __"
    num2 = gets.to_f
    last_num = num1 - num2
    puts last_num
  when "multiply"
    puts "number to multiply"
    num1 = gets.to_f
    puts "#{num1} * __"
    num2 = gets.to_f
    last_num = num1 * num2
    puts last_num
  when "divide"
    puts "number to divide"
    num1 = gets.to_f
    puts "#{num1} / __"
    num2 = gets.to_f
    last_num = num1 / num2
    puts last_num
  when "exponent"
    puts "What base number do you want to POWER?"
    num1 = gets.to_f
    puts "#{num1}^__"
    num2 = gets.to_f
    last_num = num1 ** num2
    puts last_num
  when "sqrt"
    puts "What number do you want to find the square root of?"
    num1 = gets.to_f
    last_num = Math.sqrt(num1)
    puts last_num
  when "quit"
    puts "Are you sure you want to quit? (Y/N)"
    yesno = gets.chomp.downcase
    if yesno == "y"
      in_operation = false
    end
  else
    puts "Invalid command: try again!"
  end
end
