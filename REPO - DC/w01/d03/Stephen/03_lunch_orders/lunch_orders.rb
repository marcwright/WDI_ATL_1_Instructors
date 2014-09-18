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
# Stephen Stanwood (stephen@stanwoodsolutions.com)

def items_string(items)
  case items.size
  when 0
    return ""
  when 1
    return items[0]
  when 2
    return items[0] + " & " + items[1]
  when 3
    first = items[0]
    items.shift
    return first + ", " + items_string(items)
  end
end

def prompt(query)
  print query
  return gets.chomp
end

orders = {}

while
  name = prompt("Name for order ('q' to end): ")
  break if name.downcase == 'q'

  name = name.to_sym
  index = 0
  orders[name] ||= []

  while true
    item = prompt("==> #{name} wants to order ('q' to end): ")
    break if item.downcase == 'q'
    orders[name].push(item)
  end
  puts
end

puts
orders.each {|name, items| puts "#{name.to_s} ordered a #{items_string(items)}."}
>>>>>>> 6be3f245f9f5cbe2977dffc9b67b6e047f812b24
