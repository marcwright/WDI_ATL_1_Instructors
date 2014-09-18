orders = {}

while true
  puts "What is the name for this order?"
  name = gets.chomp

  puts "What does #{name} want to order?"
  order = gets.chomp

  if !orders.has_key?(name)
    orders[name] = []
  end

  orders[name].push(order)

  puts "Add another item to the order? (y/n)"
  add_item = gets.chomp.downcase
  break if add_item == "n"
end

puts orders

