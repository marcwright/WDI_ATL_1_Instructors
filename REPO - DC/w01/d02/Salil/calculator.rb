answer = "n"
  def add (num1, num2)
    puts "Your sum is #{num1 + num2}"
  end

  def subt (num1, num2)
    puts "Your difference is #{num1 - num2}"
  end

  def mult (num1, num2)
    puts "Your product is #{num1 * num2}"
  end

  def div (num1, num2)
    puts "Your difference is #{num1 / num2}"
  end


  def exp (num1, num2)
    puts "Your number is #{num1 ** num2}"
  end

  def sqrt (num1)
    puts "Your square root is #{Math.sqrt(num1)}"
  en

while answer == "n"

  puts "Main Menu:\nPress 1 for Addition\nPress 2 for Subtraction\nPress 3 for Multiplication\nPress 4 for Division\nPress 5 for Exponentiation\nPress 6 for Square Root"
  choice = gets.to_i
  puts "Please enter your first number"
  num1 = gets.to_i
  if choice != 6
    puts "Please enter your second number"
    num2 = gets.to_i
  end
  if choice == 1
    add(num1, num2)
  elsif choice == 2
    subt(num1, num2)
  elsif choice == 3
    mult(num1, num2)
  elsif choice == 4
    div(num1, num2)
  elsif choice == 5
    exp(num1, num2)
  elsif choice == 6
    sqrt(num1)
  else
    puts "Please try again"
  end
  puts "Would you like to quit? (Y or N)"
  answer = gets.chomp.downcase
end


