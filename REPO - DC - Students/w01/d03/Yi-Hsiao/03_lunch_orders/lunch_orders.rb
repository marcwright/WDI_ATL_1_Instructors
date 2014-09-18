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
# ## Lunch Orders

# It's approaching lunch hour… let's collect orders. Create a new file called `lunch_orders.rb` to complete this exercise.

# 1. Create a program that collects lunch orders. Prompt:
# 	* **Name for order:** (enter name)
# 	* **{name} wants to order:** (enter item)
# 2. Store the name/order data. When storing data, do it in such a way that additional order items may be added for the person's name.
# 	* Example: **Greg** can order a *Burger*, and then add *Fries* to his order later.
# 3. After storing data, prompt the user with:
# 	* **Add another item to the order? (y/n)**
# 	* Repeat steps 1 & 2 if the answer is "y"
# 3. After the user completes adding orders, print out:
# 	* **"All orders: {order data}"**

# ### Keep going...

# Rather than printing out a blob of raw lunch order data, print each name's orders on a separate line, formatted as one of the following:

# * "Greg ordered a sandwich"
# * "Peter ordered a burger & fries"
# * "Travis ordered a salad, guac & water"

# *You may have to do some hunting in Ruby docs!*

def order_lunch_for person
  order_items = []
  while true
    puts order_items.length == 0 ? "What would #{person} like to order first?" : "Anything else?"
    puts "(Or type 'DONE' when you're done with this order.)", ""
    user_input = gets.chomp.downcase
    return order_items if user_input == "done"
    order_items << user_input
  end
end

def collect_orders
  orders = {}
  while true
    puts orders.length == 0 ? "Who would like to order first?" : "Anybody else?"
    puts "(Or type 'DONE' if you've finished all orders.)", ""
    user_input = gets.chomp
    return orders if user_input.downcase == "done"
    owner = user_input.split.map(&:capitalize).join(" ")  # capitalize name
    orders[owner.to_sym] = order_lunch_for owner
  end
end

def print_orders orders
  # pretty prints orders
  # expects a Hash in the form {name1: [order1, order2...]}

  orders.each do |name, orders|
    orders_str = orders.length > 1 ? "#{orders[0...-1].join(', ')}, and #{orders[-1]}" : orders.join
    puts "#{name} ordered a #{orders_str}."
  end
end

puts "Welcome to the self-service lunch order machine."
orders = collect_orders
puts
print_orders orders
>>>>>>> 6be3f245f9f5cbe2977dffc9b67b6e047f812b24
