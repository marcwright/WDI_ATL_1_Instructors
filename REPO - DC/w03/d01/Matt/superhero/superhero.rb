require 'pg'

answer = "Z"

### seed data
# 1) create superhero_db 2) cd into superhero 3) run command "psql -d superhero -f superhero.sql"

# connect
db_call = PG.connect(:dbname => 'superhero', :host => 'localhost')

# show all superhero names
def view_all_names(db_call)
  index_results = db_call.exec('SELECT superhero_name FROM superheroes;')
  puts ""
  puts index_results.values
  puts ""
end

# create a superhero
def add_superhero(db_call)
  puts "Superhero name:"
  add_name = gets.chomp
  puts "Alter Ego:"
  add_alter_ego = gets.chomp
  puts "Do they have a cape? (true/false):"
  add_cape = gets.chomp.downcase
  puts "What is their power?:"
  add_power = gets.chomp
  puts "What is their arch nemesis?:"
  add_nemesis = gets.chomp
  add_results = db_call.exec("INSERT INTO superheroes (superhero_name, alter_ego, has_cape, power, arch_nemesis) VALUES ('#{add_name}', '#{add_alter_ego}', '#{add_cape}', '#{add_power}', '#{add_nemesis}' )")
  puts ""
  puts "You just added #{add_name}"
  puts ""
end

# view all info for a specific superhero
def view_info(db_call)
  view_all_names(db_call)
  puts "Enter the name of the superhero want to view:"
  puts ""
  view_superhero = gets.chomp
  puts ""
  view_superhero_results = db_call.exec("SELECT * FROM superheroes WHERE '#{view_superhero}' = superhero_name;")
  puts view_superhero_results.values
  puts ""
end

# update a superhero
def update_superhero(db_call)
  view_all_names(db_call)
  puts ""
  puts "Which superhero would you like to update?"
  update_superhero = gets.chomp
  puts ""
  puts "Enter the new details:"
  puts ""
  puts "New superhero name:"
  update_superhero_name = gets.chomp
  puts ""
  puts "New alter ego:"
  update_superhero_alter_ego = gets.chomp
  puts ""
  puts "Did they recently acquire a cape? (true/false):"
  update_superhero_cape = gets.chomp
  puts ""
  puts "What is their new power?"
  update_superhero_power = gets.chomp
  puts ""
  puts "Who is their new arch nemesis?"
  update_superhero_nemesis = gets.chomp
  db_call.exec("UPDATE superheroes SET superhero_name='#{update_superhero_name}',
    alter_ego='#{update_superhero_alter_ego}',
    has_cape='#{update_superhero_cape}',
    power='#{update_superhero_power}',
    arch_nemesis='#{update_superhero_nemesis}'
    WHERE '#{update_superhero}'=superhero_name;")
  puts ""
end

# delete a superhero
def remove_superhero(db_call)
  view_all_names(db_call)
  puts "Enter the name of the superhero you want to delete:"
  delete_superhero = gets.chomp
  delete_superhero_results = db_call.exec("DELETE FROM superheroes WHERE superhero_name = '#{delete_superhero}';")
  puts ""
end

while answer != "Q"
  puts "What superhero info would you like?"
  puts "(I) View all superhero names"
  puts "(C) Add a superhero"
  puts "(R) View all info for a specific superhero"
  puts "(U) Update a superhero"
  puts "(D) Delete a superhero"
  puts "(Q) Quit"
  puts ""
  puts "Enter a letter:"
  puts ""
  answer = gets.chomp.upcase

  case answer
  when "I"
    view_all_names(db_call)
  when "C"
    add_superhero(db_call)
  when "R"
    view_info(db_call)
  when "U"
    update_superhero(db_call)
  when "D"
    remove_superhero(db_call)
  when "Q"
    break
  else
    answer == "Z"
  end
end
