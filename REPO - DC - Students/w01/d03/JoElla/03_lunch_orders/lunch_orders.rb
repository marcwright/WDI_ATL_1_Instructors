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

  puts "What's the name for this order?"
  name = gets.chomp

  puts "#{name} wants to order?"
  food = gets.chomp

  if !orders.has_key?(name) #checks to see if key with given name exists
    orders[name] = [] #if key doesn't exist, creates it w/ empty array
  end

  orders[name].push(food) #finds key and PUSHES new value to food array



  puts "do you have more orders?(y/n)"
  continue = gets.chomp.downcase

  puts orders.join(' ordered ')

  break if continue == "n"

end


>>>>>>> 6be3f245f9f5cbe2977dffc9b67b6e047f812b24
