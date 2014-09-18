def adding(num1, num2)
	return num1 + num2
end

def subtracting(num1, num2)
	return num1 - num2
end

def multiply(num1, num2)
	return num1 * num2
end

def square(num1)
	return Math.sqrt(num1)
end

def exponation(num1, num2)
	return num1**num2
end

def trig(num1)
	puts "Would you like the sin, cos, or tan of the number?"
	trig_answer = gets.chomp
		if trig_answer == "sin"
			return Math.sin(num1)
		elsif trig_answer == "cos"
			return Math.cos(num1)
		elsif trig_answer == "tan"
			return Math.tan(num1)
		end	
end

def factorial(num1)
  if num1 == 0
    return 1
  else
    return num1 * factorial(num1-1)
  end
end

operation = ""

while operation != "0" && operation != "[0]"
	puts"Welcome to the Ruby Calculator!"
	puts "Menu: Please select your desired operation by selecting the corresponding number below:"
	puts "[1] - Addition"
	puts "[2] - Subtraction"
	puts "[3] - Multiplication"
	puts "[4] - Division"
	puts "[5] - Exponents"
	puts "[6] - Square Roots"
	puts "[7] - Trigonometric Functions (sin, cos, tan)"
	puts "[8] - Factorial Option\n"
	puts "[0] - Quit the Calculator"

	operation = gets.chomp

	if operation != "0" && operation != "[0]" 
		if operation == "7" || operation == "[7]" || operation == "8" || operation == "[8]" || operation == "6" || operation == "[6]"
		puts "What is the number to be evaluated?"
		num1 = gets.to_i
		else
			puts "Please enter the first number of the equation..."
			num1 = gets.to_i
			puts "And what is the second number of the equation?"
			num2 = gets.to_i
		end	

		case operation
		when "1" || "[1]"
			puts "#{num1} + #{num2} = #{adding(num1, num2)}."
		when "2" || "[2]"
			puts "#{num1} - #{num2} = #{subtracting(num1, num2)}."
		when "3" || "[3]"
			puts "#{num1} * #{num2} = #{multiply(num1, num2)}."
		when "4" || "[4]"
			total = num1 / num2
			remainder = num1 % num2
			puts "#{num1} / #{num2} = #{total}"
			if remainder != 0
				puts "with a remainder of #{remainder}."
			end
		when "5" || "[5]"
			puts "#{num1}^#{num2} = #{exponation(num1, num2)}."
		when "6" || "[6]"
			puts "The square root of #{num1} is #{square(num1)}."
		when "7" || "[7]"
			puts "The selected Triganomic Function of #{num1} is #{trig(num1)}."
		when "8" || "[8]"
			puts "The factorial of your number is #{factorial(num1)}."
		end
	end
end
puts "Adios amigo!!"