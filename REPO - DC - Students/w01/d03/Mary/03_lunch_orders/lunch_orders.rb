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

lunch_hash = {}

while true
  puts "Okay, what's your name for the order?"
  name = gets.chomp.capitalize.to_sym
  orders = []

  while true
    puts "#{name}, what would you like in your order?"
    order_new = gets.chomp
    orders.push(order_new)

    lunch_hash[name] = orders

    puts "Would you like to add another item to your order? Y/N"
    continue = gets.chomp.upcase
    break if continue == "N"

  end

  puts "Are there more people that need to add their orders? Y/N"
  more_people = gets.chomp.upcase
  break if more_people == "N"

end

lunch_hash.each do |key, array|
  puts "#{key} ordered a #{array.join(', ')}."
end
>>>>>>> 6be3f245f9f5cbe2977dffc9b67b6e047f812b24
