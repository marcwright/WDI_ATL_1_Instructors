intro = "What would you like to do; add, subtract, multiply, divide, exponentiate, find the root, find the sine, find the cosine, find the tangent, or quit?"
puts intro
user_choice = gets.chomp
puts "great choice, lets #{user_choice}!"

def calculator(num1,num2)

puts "what number would you like to start with?"
num1 = gets.to_i
puts "ok, lets #{user_choice} by/of what number?"
num2 = gets.to_i

case calculator
when user_choice == "add"
	puts add(num1,num2)
when user_choice == "subtract"
	puts subtract(num1,num2)
when user_choice == "multiply"
	puts multiply(num1,num2)
when user_choice == "divide" 
	puts divide(num1,num2)
end
end

def add(num1,num2)
	num1 + num2
end

def subtract(num1,num2)
	num1 - num2
end

def multiply(num1,num2)
	num1 * num2
end

def divide(num1,num2)
	num1 / num2
end

def exponent(num1,num2)
	num1 ** num2
end

def sqrt(num)
	Math.sqrt(num)
end

def sin(num)
	Math.sin(num)
end

def cos(num)
	Math.cos(num)
end

def tan(num)
	Math.tan(num)
end
