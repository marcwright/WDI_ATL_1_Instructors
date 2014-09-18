require 'pry'

orders ={ }

while true

  puts "Name for order: "
  name = gets.chomp

  puts "#{name} wants to order?"
  orders = gets.chomp

  if !orders.has_key?(name)
    orders[name] = []
  end

orders[name].push(order)

puts "Another item (y/n)?"
break if !gets.index('y')

end

puts orders
  # order_name = get_response("What is the name for the order?")
  # order_food = get_response("What would you like for lunch?")

  # puts "#{order_name} wants to order #{order_food}"


