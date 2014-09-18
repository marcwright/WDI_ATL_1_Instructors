puts "Welcome to the calculator!  Would you like to use the calculator (y/n)?"
response = gets.chomp.downcase

def add(num_1, num_2)
  return num_1 + num_2
end

def subtract(num_1, num_2)
  return num_1 - num_2
end

def multiply(num_1, num_2)
  return num_1*num_2
end

def divide(num_1, num_2)
  return num_1/num_2
end

def exponent(base, power)
  return base**power
end

def square_root(number)
  return number**0.5
end

while response == "y"
  puts  "Please chose an operation from the menu: add, subtract, multiply, divide, exponent, square_root"
  operation = gets.chomp.downcase
  if operation == "exponent"
    puts "Please enter the base number first and then the exponent to which you want it raised."
    base = gets.to_i
    power = gets.to_i
    puts exponent(base, power)
  elsif operation == "square_root"
    puts "Please enter the number that you want to know the square root of:"
    number = gets.to_i
    puts square_root(number)
  else
    puts "Please enter the two numbers you wish to operate on, typing the greater of the two numbers first:"
    num_1 = gets.to_i
    num_2 = gets.to_i
    case operation
      when "add" then puts add(num_1, num_2)
      when "subtract" then puts subtract(num_1, num_2)
      when "multiply" then puts multiply(num_1, num_2)
      when "divide" then puts divide(num_1, num_2)
      end
  end
  puts "Would you like to perform another operation (y/n)?"
  response = gets.chomp.downcase
end

puts "Thanks for using the calculator, come back any time!"

