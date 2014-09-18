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
taking_orders = true
all_orders = {}

while taking_orders == true
  puts "Who is this order for?"
  name = gets.chomp
  puts "What are you ordering?"
  food = gets.chomp

  if !all_orders.has_key?(name)
    all_orders[name] = []
  end

  all_orders[name].push(food)

  puts "Great! Want to add more food? (Y/N)"
  option = gets.chomp.downcase
  taking_orders = false if option == "n"
end

  puts "Here are all the orders: #{all_orders}"
>>>>>>> 6be3f245f9f5cbe2977dffc9b67b6e047f812b24
