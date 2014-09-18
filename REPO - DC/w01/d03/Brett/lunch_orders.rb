orders = {}

while true

  print "Name for order: "
  name = gets.chomp

  print "#{name} wants to order: "
  order = gets.chomp

  if !orders.has_key?(name) # Orders hash. Do you have a key named "Frankenstein"?
    orders[name] = [] # If not, create/define a hash using Frankenstein as key and order as the value
  end

   orders[name].push(order)

  print "Do you want to add another order? (y/n): "
  continue = gets.chomp.downcase

  break if continue == "n"

end

puts orders
