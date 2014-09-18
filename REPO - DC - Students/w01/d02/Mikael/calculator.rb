require 'pry'

def calculate(operation = nil, first = nil, second = nil)
  case operation
  when "add"
    return first + second
  when "sub"
    return first - second
  when "mul"
    return first * second
  when "div"
    return first / second
  when "exp"
    return first ** second
  when "sqrt"
    return Math.sqrt(first)
  when "sin"
    return Math.sin(first)
  when "cos"
    return Math.cos(first)
  when "tan"
    return Math.tan(first)
  when "fac"
    if first == 0
      return 1
    else
      for i in 1..first
        result = result * (first - 1)
      end
    return result
    end
  end
end

  else
    return "Sorry, that is not a valid operation."
  end

end

puts "Welcome to the calculator!"
puts "You may add, subtract (sub), multiply (mul), divide (div), exponentiate (exp), square root (sqrt), sine (sin), cosine (cos), tangent (tan), or factorial (fac)."
resp = "yes"
while resp == "yes"
  puts "Please enter an operation, followed by the first operand, followed by the second operand. [i.e. calculate(\"exp\",2,3)]"
  puts "When you are done, enter \"no\""
  resp = gets.chomp.downcase
  if resp == "yes"
    puts "Enter your command."
  end
end
binding.pry
