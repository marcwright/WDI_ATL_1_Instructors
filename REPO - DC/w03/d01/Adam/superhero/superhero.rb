require 'pry'
require 'pg'

db_conn = PG.connect(:dbname => 'superheros.db', :host => 'localhost')

puts ''
puts 'Pleaes choose from the following options:'
puts ' (I) Index - List all Super Heros'
puts ' (C) Add a Super Hero'
puts ' (R) View all info for a specific Super Hero'
puts ' (U) Update a Super Hero'
puts ' (D) Remove a Super Hero'
puts ''

# Methods

def list_heros(db)
  puts 'Here is a list of all the heros:'
  puts ''
  puts db.exec("SELECT superhero_name FROM superhero;").values
  puts ''
end

# Menu for user selection (interface)

answer = gets.chomp.upcase

  if answer == 'I'
    puts 'you picked I'
    list_heros(db_conn)
  elsif answer == 'C'
    puts 'you picked C'
  elsif answer == 'R'
    puts 'you picked R'
  elsif answer == 'U'
    puts 'you picked U'
  elsif answer == 'D'
    puts 'you picked D'
  else
    puts 'That was not valid bro'
  end
