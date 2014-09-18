

def calc(math_type)

  if math_type == 1
    num = a.to_i + b.to_i
    puts num
  elsif math_type == 2
    num = a.to_i - b.to_i
    puts num
  elsif math_type == 3
    num = a.to_i * b.to_i
    puts num
  elsif math_type == 4
    num = a.to_i / b.to_i
    puts num
  else
    puts "Please pick a number 1 - 4"
  end
  return num
end

puts "Enter a type of math:\n1 Addition\n2 Subtraction\n3 Multiplication\n4 Division\n5 Quit"
math_type = gets.to_i

while type != 5
  calc(math_type)
end

puts "Give me a number to math"
a = gets

puts "Give me a second number to math"
b = gets
