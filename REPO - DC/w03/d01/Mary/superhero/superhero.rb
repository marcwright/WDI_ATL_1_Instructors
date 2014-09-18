
require 'pg'
db_conn = PG.connect(:dbname => 'superheroes_db', :host => 'localhost')


puts "What would you like to do? Please choose a letter from menu below:"
puts "(I) Index - List all Super Heros"
puts "(A) Add a Super Hero"
puts "(V) View all info for a specific Super Hero"
puts "(U) Update a Super Hero:"
puts "(R) Remove a Super Hero"
menu_choice = gets.chomp.upcase

case menu_choice
when "I"
  puts db_conn.exec("SELECT superhero_name FROM superheroes").values

when "A"
  puts "What is the superhero name?"
  superhero_name = gets.chomp
  puts "What is the alter-ego?"
  alter_ego = gets.chomp
  puts "Do they have a cape? T/F"
  has_cape = gets.chomp
  puts "What is their power?"
  power = gets.chomp
  puts "Who is their arch-nemesis?"
  arch_nemesis = gets.chomp
  db_conn.exec("INSERT INTO superheroes (superhero_name, alter_ego, has_cape, power, arch_nemesis) VALUES ( '#{superhero_name}', '#{alter_ego}', '#{has_cape}', '#{power}', '#{arch_nemesis}');")
  puts db_conn.exec("SELECT superhero_name FROM superheroes").values

when "V"
  puts "Which hero would you like info for?"
  puts db_conn.exec("SELECT superhero_name FROM superheroes").values
  hero_info_choice = gets.chomp
  puts db_conn.exec("SELECT * FROM superheroes WHERE superhero_name = '#{hero_info_choice}'").values
  #how can i make this prettier with attributes printing out along with valeus?

when "U"
  puts "Which superhero would you like to update?"
  puts db_conn.exec("SELECT superhero_name FROM superheroes").values
  hero_update_choice = gets.chomp
  puts "Which trait would you like to update?"
  trait_update_choice = gets.chomp
  puts "What would you like #{trait_update_choice} to be?"
  updated_info = gets.chomp
  puts db_conn.exec("UPDATE superheroes SET #{trait_update_choice} = '#{updated_info}' WHERE superhero_name = '#{hero_update_choice}'")

when "R"
  puts "Which superhero would you like to remove?"
  puts db_conn.exec("SELECT superhero_name FROM superheroes").values
  hero_remove_choice = gets.chomp
  puts db_conn.exec("DELETE FROM superheroes WHERE superhero_name = '#{hero_remove_choice}'")

end

db_conn.close
