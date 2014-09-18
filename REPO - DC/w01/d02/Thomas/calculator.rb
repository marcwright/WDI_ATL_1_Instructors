puts "Would you like to do some math with me (y/n)"
response = gets.chomp.downcase
  
def add(num1,num2)
	return num1 + num2
end


def subtract(num1,num2)
	return num1 - num2
end


def multiply(num1,num2)
	return num1 * num2
end


def divide(num1,num2)
	return num1 / num2
end

def exponentiate(num1,num2)
	return num1 * num2
end

def square_root(num1)
	Math.sqrt(num1)
end

def sin(num1)
	Math.sin(num1)
end

while response == "y"

puts "What would you like to do; add, subtract, multiply, divide, exponentiate, square_root, sin, or quit?"
user_choice = gets.chomp
  if user_choice == "square_root"
    puts "ok, what number would you like to find the #{user_choice} of?"
    num1 = gets.to_i
    puts square_root(num1)
  elsif user_choice == "exponentiate"
    puts "great choice, lets #{user_choice}!"
    puts "what number would you like to use as a base number?"
    num1 = gets.to_i
    puts "ok, lets #{user_choice} by what number?"
    num2 = gets.to_i
    puts exponentiate(num1,num2)
  else
    puts "great choice, lets #{user_choice}!"
    puts "what two numbers would you like to use"
    num1 = gets.to_i
    num2 = gets.to_i
  
    case user_choice
      when "add"
	    puts add(num1,num2)
    when "subtract"
	    puts subtract(num1,num2)
    when "multiply"
	    puts multiply(num1,num2)
    when "divide" 
	    puts divide(num1,num2)
    end

puts "Would you like to perform another operation (y/n)?"
response = gets.chomp.downcase

end 
end

puts "thanks for working!"



