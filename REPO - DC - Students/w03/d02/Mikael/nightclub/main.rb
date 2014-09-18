require_relative 'lib/nightclub'

# Prints all clubbers in the nightclub:
def print_clubbers
  puts "# Current clubbers: #"

  # Print all clubbers...

end

# Adds clubbers to the nightclub:
def add_clubber

end

# Removes clubbers from the nightclub:
def remove_clubber

end

# Main menu app:
while true
  puts "## Welcome to Club WDI ##"
  print_clubbers()

  puts "# What would you like to do? #"
  puts "1. Add a clubber"
  puts "2. Remove a clubber"
  puts "3. Quit"
  action = gets.chomp.to_i

  case action
  when 1
    add_clubber()
  when 2
    remove_clubber()
  when 3
    $connection.disconnect!
    break
  end
end
