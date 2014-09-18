# Your program should have a menu that allows you to perform the following actions:

# (I) Index - List all Super Heros
# (C) Add a Super Hero
# (R) View all info for a specific Super Hero
# (U) Update a Super Hero
# (D) Remove a Super Hero

require 'pg'
require 'pry'

connection = PG.connect(:dbname => 'superhero_db', :host => 'localhost')

def ask_question(question)
  puts question
  answer = gets.chomp
  return answer
end

def display_heroes(connection)
  puts connection.exec( "SELECT name FROM superheroes" )
end

def add_hero(connection)
  name = ask_question("What is the superhero's name?")
  secret_identity = ask_question("What is their secret identity?")
  has_cape = ask_question("Do they have a cape? (y/n)")
    if has_cape  == "y"
      has_cape = true
    else
      has_cape = false
    end
  superpower = ask_question("What is their super power?")
  nemesis = ask_question("Who is their archnemesis?")

  connection.exec( "INSERT INTO superheroes (name, secret_identity, has_cape, strength, rival) VALUES ( '#{name}', '#{secret_identity}', '#{has_cape}', '#{superpower}', '#{nemesis}');" )
end

def view_details(connection, name)
  result = (connection.exec( "SELECT * FROM superheroes WHERE name = '#{name}';"))
  puts "The Superhero's name is #{result[0][1]}."
  puts "Their secret identity is #{result[0][2]}."
    if result[0][3] == true
      puts "They have a cape."
    else
      puts "They don't have a cape."
    end
  puts "Their superpower is #{[0][4]}."
  puts "Their archnemesis is #{[0][5]}."
end

def update_hero(connection, superhero_name, update_input)
    case
     when 1
       name = ask_question("What would you like to change #{superhero_name}'s name to?")
       connection.exec("UPDATE superheroes SET name = '#{name}' WHERE name = '#{superhero_name}';")
     when 2
       secret_identity = ask_question("What would you like to change #{superhero_name}'s alias to?")
       connection.exec("UPDATE superheroes SET secret_identity = '#{secret_identity}' WHERE name = '#{superhero_name}';")
     when 3
       has_cape = ask_question("Does the #{superhero_name} have a cape?")
       connection.exec("UPDATE superheroes SET has_cape = '#{has_cape}' WHERE name = '#{superhero_name}';")
     when 4
       superpower = ask_question("What is #{superhero_name}'s superpower?")
       connection.exec("UPDATE superheroes SET superpower = '#{superpower}' WHERE name = '#{superhero_name}';")
     when 5
       nemesis = ask_question("Who is #{superhero_name}'s archnemesis?")
       connection.exec("UPDATE superheroes SET nemesis = '#{nemesis}' WHERE name = '#{superhero_name}';")
     else
     end
   end
end

 def delete_hero(connection, name)
  connection.exec("DELETE FROM superheroes WHERE name = '#{name}';")
end

menu_status = true

while menu_status true



end
