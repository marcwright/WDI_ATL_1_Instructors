require_relative 'lib/nightclub'

# Prints all clubbers in the nightclub:
def print_clubbers
  puts "# Current clubbers: #"
  Clubber.all.each do |clubber|
    puts clubber.name
  end

  # Print all clubbers...

end

# Adds clubbers to the nightclub:
def add_clubber
  clubber = Clubber.new
  puts "What is their name?"
  clubber.name = gets.chomp
  puts "What is their gender?"
  clubber.gender = gets.chomp
  puts "What is their age?"
  clubber.age = gets.chomp

end

# Removes clubbers from the nightclub:
def remove_clubber
  puts "What is the name of the clubber you would like to remove?"
  clubber = Clubber.find_by(name: gets.chomp)
  clubber.destroy

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
