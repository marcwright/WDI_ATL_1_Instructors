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
orders = Hash.new
orders = {}

more_orders = "y"

while more_orders == "y"

puts "enter name :"
name = gets.chomp.downcase

puts "please enter the order for #{name} :"
order = gets.chomp.downcase

if !orders.has_key?(name)
  then orders[name] = [] #creates a hash key with an empty value
end

orders[name].push(order) #pushes the order for name up into the value for the new hash name.

  puts "another order to input? y / n "
  more_orders = gets.chomp.downcase

break if more_orders == "n"

end

puts "all orders: #{orders}"
puts hash.keys
puts hash.value


>>>>>>> 6be3f245f9f5cbe2977dffc9b67b6e047f812b24
