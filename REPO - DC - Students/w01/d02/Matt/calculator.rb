# method to perform calculations

def calc(a, b)
  puts "Enter a type of math:\n1 Addition\n2 Subtraction\n3 Multiplication\n4 Division\n5 Square Root\n6 Power\n7 Quit"
  math_type = gets.to_i
  if math_type == 1
    puts "#{a} + #{b} ="
    add = a.to_i + b.to_i
    puts add
  elsif math_type == 2
    puts "#{a} - #{b} ="
    sub = a.to_i - b.to_i
    puts sub
  elsif math_type == 3
    puts "#{a} * #{b} ="
    times = a.to_i * b.to_i
    puts times
  elsif math_type == 4
    puts "#{a} / #{b} ="
    div = a.to_i / b.to_i
    puts div
  elsif math_type == 5
    puts "sqrt(#{a}) ="
    exp = Math.sqrt(a.to_i)
    puts exp
  elsif math_type == 6
    puts "#{a} ** #{b} ="
    pwr = a.to_i ** b.to_i
    puts pwr
  else
  return false
end

while math_type != 5
  calc(math_type)
end

puts "Give me a number to math"
a = gets.chomp
puts "Give me a second number to math"
b = gets.chomp

calc1 = calc(a, b)
puts calc1
