#require 'pry'

def menu
  puts " "
  puts "Calculator 1.0"
  puts " "
  puts "Menu - (Enter an option below)"
  puts " "
  puts "1 Addition"
  puts "2 Subtraction"
  puts "3 Multiplication"
  puts "4 Division"
  puts "5 Quit"
  puts " "
end

def addition (v1, v2)
  puts " "
  return (v1 + v2)
end

def subtraction (vl, v2)
  puts " "
  return (v1 - v2)
end

def multiplication (v1, v2)
  puts " "
  return (v1 * v2)
end

def division (v1, v2)
  puts " "
  return (v1 / v2)
end


while true
  menu()
  puts "Select an operation"
  operation = gets.to_i

  if operation == 5
    puts " "
    puts "That will be $1 please"
    puts " "
    break
  end

  puts "Enter the first value"
  val_1 = gets.to_i

  puts "Enter the second value"
  val_2 = gets.to_i

  if operation == 1
    puts addition(val_1, val_2)
  elsif operation == 2
    puts subtraction(val_1, val_2)
  elsif operation == 3
    puts multiplication(val_1, val_2)
  elsif operation == 4
    puts division(val_1, val_2)
  end
end

