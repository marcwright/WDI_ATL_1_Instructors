# Stephen Stanwood (stephen@stanwoodsolutions.com)

require_relative 'lib/nightclub'
require 'colorize'

# Prints all clubbers in the nightclub:
def print_clubbers
  puts "# Current clubbers: #"
  puts Clubber.all
end

# Adds clubbers to the nightclub:
def add_clubber
  attrs = []
  ["name", "gender", "age"].each do |attr|
    print "#{attr} to add: "
    attrs.push(gets.chomp)
  end

  c = Clubber.create(name: attrs[0], gender: attrs[1], age: attrs[2].to_i)
  if c.errors.any?
    print "ERROR(S): ".magenta
    puts c.errors.full_messages.join(', ').magenta
  end
end

# Removes clubbers from the nightclub:
def remove_clubber
  print "==> remove whom? "
  Clubber.where(name: gets.chomp).destroy_all
end

# Main menu app:
while true
  puts "## Welcome to Club WDI ##".cyan
  print_clubbers
  puts

  puts "# What would you like to do? #"
  puts "1. Add a clubber"
  puts "2. Remove a clubber"
  puts "3. Quit"
  action = gets.chomp.to_i

  case action
  when 1
    add_clubber
  when 2
    remove_clubber
  when 3
    $connection.disconnect!
    break
  end

  puts
end
