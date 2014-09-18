require 'pry'

# define the different operations
def add(x, y)
  return x + y
end

def subtract(x, y)
  return x - y
end

def multiply(x, y)
  return x * y
end

def divide(x, y)
  return x / y
end

def exponent(x, y)
  return x ** y
end

def square_root(x)
  return Math.sqrt(x)
end

 exit = false

# create the menu and keep looping until user types "exit"
 while exit == false
  puts "What operation would you like to run:"
  puts "add"
  puts "subtract"
  puts "multiply"
  puts "divide"
  puts "exponent"
  puts "square root"
  puts "exit"
   operation = gets.chomp.downcase
   if operation != "exit"
    puts "Please input an x value:"
    x = gets.to_i
    puts "Please input a y value:"
    y = gets.to_i

    if operation == "add"
      puts add(x, y)
    elsif operation == "subtract"
      puts subtract(x, y)
    elsif operation == "multiply"
      puts multiply(x, y)
    elsif operation == "divide"
      puts divide(x, y)
    elsif operation == "exponent"
      puts exponent(x, y)
    elsif operation == "square root"
      puts square_root(x)
    elsif operation == "exit"
      puts "Goodbye!"
      exit =! true
    else
      puts "Invalid input."
    end

  else
    exit = true
  end
 end
