orders = {}


while true

  puts "Name for order: (enter name)"
  name = gets.chomp.capitalize

  puts "#{name} wants to order: (enter item)"
  order = gets.chomp.downcase

  if !orders.has_key?(name) # asks if hash contains name
    orders[name] = []
  end

  orders[name].push(order)

  puts "Add another item to the order? (y/n)"
  break if !gets.index('y')

end

puts "All orders: #{orders}"




