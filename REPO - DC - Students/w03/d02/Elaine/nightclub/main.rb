require_relative 'lib/nightclub'
db_conn = PG.connect(dbname: 'nightclub')

# Prints all clubbers in the nightclub:
def print_clubbers
  db_conn = PG.connect(dbname: 'nightclub')
  puts "# Current clubbers: #"

  # Print all clubbers...
  puts ""
  results = db_conn.exec("SELECT * FROM clubbers;")
  results.values.each { |superhero| puts superhero[1] }
  puts ""
end

# Adds clubbers to the nightclub:
def add_clubber
  db_conn = PG.connect(dbname: 'nightclub')
  puts ""
  puts "What is the clubber's name?"
  name = gets.chomp
  puts ""
  puts "What is the clubber's gender?"
  gender = gets.chomp
  puts ""
  puts "What is the clubber's age?"
  age = gets.to_i
  puts ""

  insert = Clubber.create(name: name, gender: gender, age: age)
end

# Removes clubbers from the nightclub:
def remove_clubber
  db_conn = PG.connect(dbname: 'nightclub')
  puts ""
  puts "Enter the name of the clubber you would like to remove."
  puts ""

  results = db_conn.exec("SELECT * FROM clubbers;")
  results.values.each { |clubber| puts clubber[1] }
  puts ""
  clubber_selected = gets.chomp
  puts ""

  delete = db_conn.exec("DELETE FROM clubbers WHERE name = '#{clubber_selected}';")
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
