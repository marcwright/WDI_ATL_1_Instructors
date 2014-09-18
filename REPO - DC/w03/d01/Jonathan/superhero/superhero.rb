require 'pg'
require 'pry'

db_conn = PG.connect(:dbname => 'superhero_db', :host => 'localhost')


def list_heroes(db_call)
  index_results = db_call.exec("SELECT superhero_name FROM superhero;")
    puts
    puts "Superheros:"
    puts index_results.values
    puts
  # index_results.values = index.each { |row| puts "#{row[0]}"}
end

def add_hero(db_call)
  puts
  puts "Enter hero name:"
  name_input = gets.chomp.to_s
  puts "Enter hero's alter ego:"
  ego_input = gets.chomp.to_s
  puts "Do they have a cape? Y or N"
  cape_input = gets.chomp.to_s.upcase
  puts "Enter the hero's power:"
  power_input = gets.chomp.to_s
  puts "Enter the hero's arch nemesis:"
  arch_input = gets.chomp.to_s
  new_hero = db_call.exec("INSERT INTO superhero (superhero_name, alter_ego, has_cape, power, arch_nemesis) VALUES ('#{name_input}','#{ego_input}','#{cape_input}','#{power_input}','#{arch_input}');")
end


# +++++++++++++++++++++++++++++++++++++++++
# Menu
# +++++++++++++++++++++++++++++++++++++++++
while true
  #menu
  puts "Menu:"
  puts "(I) List all Super Heros"
  puts "(C) Add Super Hero"
  puts "(R) View Specific Super Hero Info"
  puts "(U) Update a Super Hero"
  puts "(D) Remove a Super Hero"
  puts "(Q) Quit"
  choice = gets.chomp.upcase
  if choice == "I"
    list_heroes(db_conn)
  elsif choice == "C"
    add_hero(db_conn)
  elsif choice == "R"

  elsif choice == "U"

  elsif choice == "D"

  elsif choice == "Q"
    break
  end
end

