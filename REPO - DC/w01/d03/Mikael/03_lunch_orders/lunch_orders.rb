<<<<<<< HEAD
orders = {};

while true
  puts "Name for order:"
  name = gets.chomp

  puts "#{name} wants to order:"
  order = gets.chomp

  orders[name] ||= []
  orders[name].push(order)

  puts "Add another item to the order? (y/n)"
  break if !gets.index('y')
end

puts "\nAll orders:"
#puts orders


orders.each_pair do |key, values|
  if values.length == 1
    puts "#{key} wants a #{values[0]}"
  elsif values.length > 1
    last = values.pop
    puts "#{key} wants a #{values.join(', ')} & #{last}"
  end
end
=======

orders = {}

while true
  puts "Name for order?"
  name = gets.chomp
  puts "#{name} wants to order:"
  order = gets.chomp

  if !orders.has_key?(name)
    orders[name] = []
  end

  orders[name].push(order)

  puts "Add another item to the order? (y/n)"
  resp = gets.chomp.downcase
  break if resp == "n"
end

orders.each do |name, order|
  puts "#{name} ordered #{order}"
end
>>>>>>> 6be3f245f9f5cbe2977dffc9b67b6e047f812b24
