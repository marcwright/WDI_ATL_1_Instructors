puts "This is a calculator.  Do you feel like calculating? Y/N"
wants_math = gets.chomp.upcase

while wants_math == "Y"
  puts "Please choose an operation: addition, subtraction, multiplication, division, exponent or square root"
  math_op = gets.chomp

  #this where i get the two numbers
  puts "What's the number?"
  ur_num1 = gets.to_i
  if math_op != "square root"
  puts "What's the other number?"
  ur_num2 = gets.to_i
  end


  #these r my mathy functions
  #i'm putting them above the conditionals so they know about them
  def add(num1, num2)
    return num1 + num2
  end

  def subtract(num1, num2)
    return num1 - num2
  end

  def multiply(num1, num2)
    return num1 * num2
  end

  def divide(num1, num2)
    return num1 / num2
  end

  def exponent(num1,num2)
    return num1 ** num2
  end

  def sq_root(num1)
    return num1**0.5
  end

  #these my conditionals for function choice
text = "The answer is "
  case math_op
    when "addition"
      puts text + add(ur_num1, ur_num2).to_s
    when "subtraction"
      puts text + subtract(ur_num1, ur_num2).to_s
    when "multiplication"
      puts text + multiply(ur_num1, ur_num2).to_s
    when "division"
      puts text + divide(ur_num1, ur_num2).to_s
    when "exponent"
      puts text + exponent(ur_num1, ur_num2).to_s
    when "square root"
      puts text + sq_root(ur_num1).to_s
    else
      puts "Not a choice, friend!"
  end
  puts "Would you like to perform another operation? Y/N"
  wants_math = gets.chomp.upcase
end

