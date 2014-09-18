<<<<<<< HEAD
<<<<<<< HEAD
=======
orders={}

  puts "Name for order:"
  name = gets.chomp

while true

  puts "#{name}, what would you like to order:"
  item = gets.chomp

  if !orders.has_key?(name)
    orders[name] = []
    puts "#{name}, would you like to order another item? Enter (y) or (n)"
    orders[name].push(item)
    quit = gets.chomp.downcase
   break if quit.include? 'y'
  end

end

puts orders
=======
>>>>>>> 9a860de93c30968e6d6dda3a663586e8bf7f9022
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
<<<<<<< HEAD
=======
orders={}

  puts "Name for order:"
  name = gets.chomp

while true

  puts "#{name}, what would you like to order:"
  item = gets.chomp

  if !orders.has_key?(name)
    orders[name] = []
    puts "#{name}, would you like to order another item? Enter (y) or (n)"
    orders[name].push(item)
    quit = gets.chomp.downcase
   break if quit.include? 'y'
  end

end

puts orders
>>>>>>> cdff1657cd43d0c9dfc39f74ebe18a86917356af
=======
>>>>>>> 7f9384e37fa2584e5cfa86e7d4be27cfe4da8e92
>>>>>>> 9a860de93c30968e6d6dda3a663586e8bf7f9022
