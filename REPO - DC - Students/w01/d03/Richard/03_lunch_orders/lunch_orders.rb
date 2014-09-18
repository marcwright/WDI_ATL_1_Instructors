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
puts "Welcome to Richard's Cafe, may I have a name for your order?"
name = gets.chomp

puts "What would you like to eat, #{name}?"
order = gets.chomp

  if !orders.has_key?(name) #if
    orders[name] = []
    # defines a key in orders hash with a value as an array
  end
  orders[name].push(order)
    #for key :name, push user entry 'order' into value
  puts "Anything else?"
  break if !gets.index('y'.downcase)
end

orders

>>>>>>> 6be3f245f9f5cbe2977dffc9b67b6e047f812b24
