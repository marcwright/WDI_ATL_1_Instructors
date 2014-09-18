require 'pry'

run_program = true
while run_program

  puts "Integer Calculator Menu"
  puts "Select what type of calculations you wish to perform: "
  puts "|--Menu--||"
  puts "Select from one of the following:"
  puts "1. Addition (+)"
  puts "2. Subtraction (-)"
  puts "3. Multiplication (x)"
  puts "4. Division (/)"
  puts "5. Exponents (^)"
  puts "6. Square Root"
  puts "0. Enter 0 to exit"
  menu_select = gets.to_i

  if menu_select == 0
    puts "Goodbye!"
    run_program = false
  elsif menu_select == 5
    puts "What is your base?"
      value1 = gets.to_f
    puts "What is your exponent?"
      value2 = gets.to_f
  elsif menu_select == 6
    puts "What is your number?"
      val1 = gets.to_i
      #val2 = (0.5)
  else
    puts "What is your first number?"
      value1 = gets.to_f
    puts "What is your second number?"
      value2 = gets.to_f
  end

    def calc_basic(val1, val2, operation)
      if operation == 1
        return val1 + val2
      elsif operation == 2
        return val1 - val2
      elsif operation == 3
        return val1 * val2
      elsif operation == 4
        return val1 / val2
      elsif operation == 5
        return val1 ** val2
      else operation == 6
        #return val1 ** val2
        #return val1 ** (0.5)
        Math.sqrt(val1)
      end
    end
    
    result = calc_basic(value1, value2, menu_select)
    puts "Your answer is #{result}"
   
end
