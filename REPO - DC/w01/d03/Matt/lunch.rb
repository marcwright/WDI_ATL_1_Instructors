require 'pry'

orders = {}

while true
  puts "What is your name?"
  name = gets.chomp

  puts "What would #{name} like for lunch?"
  lunch = gets.chomp

  if !orders.has_key?(name)
    orders[name] = []
  end

  orders[name].push(lunch)

  # binding.pry

  puts "Would you like to add more food?"
  continue = gets.chomp.downcase
  break if continue == "n"
end

puts "#{name} wants #{lunch}"
