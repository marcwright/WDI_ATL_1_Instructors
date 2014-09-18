orders = {}


while
puts "Welcome to Richard's Cafe, may I have a name for your order?"
name = gets.chomp

puts "What would you like to eat, #{name}?"
order = gets.chomp

  if !order.has_key?(name)
    orders[name] = [order]
  else
    orders[order]
  end
  puts "Anything else?"
  hungry = gets.chomp
  while true
    hungry.include? 'y'
  else
   break
  end
end


