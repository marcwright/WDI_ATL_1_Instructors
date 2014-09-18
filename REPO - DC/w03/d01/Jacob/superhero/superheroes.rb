require 'pg'

superhero_conn = PG.connect(:dbname => 'superheroes_db', :host => 'localhost')


def answer_to(question)
  puts question
  answer = gets.chomp
end


def menu_options
  puts "Please select an option from the menu:"
  puts "(I) Index - List all Super Heros"
  puts "(C) Add a Super Hero"
  puts "(R) View all info for a specific Super Hero"
  puts "(U) Update a Super Hero"
  puts "(D) Remove a Super Hero"
  puts "(Q) Quit"
end

def list_heroes(connection)
  puts connection.exec("SELECT superhero_name FROM superheroes;").values
end

def add_hero(connection)
  name_input          = answer_to("What is the name of this superhero?")
  alter_ego_input     = answer_to("What is the superhero's alter ego?")
  power_input         = answer_to("What is the superhero's superpower?")
  cape_input          = answer_to("Does this superhero have a cape? (y/n)")
    if cape_input.downcase == 'y'
      cape_input = true
    else
      cape_input = false
    end
  arch_nemesis_input  = answer_to("Who is the superhero's arch nemesis?")
  connection.exec("INSERT INTO superheroes (superhero_name, alter_ego, power, has_cape, arch_nemesis) VALUES ('#{name_input}', '#{alter_ego_input}', '#{power_input}', '#{cape_input}', '#{arch_nemesis_input}');")
end

def view_info(connection)
  puts "Here are the superheroes:"
  puts list_heroes(connection)
  user_name_input = answer_to("Please enter the superhero whose information you'd like to view:")
  results = connection.exec("SELECT*FROM superheroes WHERE superhero_name = '#{user_name_input}'")
  puts results[0]
end

def update_hero(connection)
  puts "Here are the superheroes:"
  puts list_heroes(connection)
  user_name_input = answer_to("Please enter the name of the superhero whose information you'd like to update:")
  puts "Please chose the number corresponding to the attribute of #{user_name_input} you'd like to change:"
  puts "1. Name"
  puts "2. Alter Ego"
  puts "3. Cape/No Cape"
  puts "4. Superpower"
  puts "5. Arch Nemesis"
  attribute = gets.chomp.to_i
  case attribute
  when 1
    new_name = answer_to("What would you like to change #{user_name_input}'s name to?")
    connection.exec("UPDATE superheroes SET superhero_name = '#{new_name}' WHERE superhero_name = '#{user_name_input}';")
  when 2
    new_alter_ego = answer_to("What would you like to change #{user_name_input}'s alter ego to?")
    connection.exec("UPDATE superheroes SET alter_ego = '#{new_alter_ego}' WHERE superhero_name = '#{user_name_input}';")
  when 3
    new_cape_status = answer_to("What would you like to change #{user_name_input}'s cape status to? (cape/no cape)")
      if new_cape_status.downcase == "cape"
        new_cape_status = true
      else
        new_cape_status = false
      end
    connection.exec("UPDATE superheroes SET has_cape = '#{new_cape_status}' WHERE superhero_name = '#{user_name_input}';")
  when 4
    new_superpower = answer_to("What would you like to change #{user_name_input}'s superpower to?")
    connection.exec("UPDATE superheroes SET power = '#{new_superpower}' WHERE superhero_name = '#{user_name_input}';")
  when 5
    new_nemesis = answer_to("Who would you like to change #{user_name_input}'s arch-nemesis to?")
    connection.exec("UPDATE superheroes SET arch_nemesis = '#{new_nemesis}' WHERE superhero_name = '#{user_name_input}';")
  end
end

def remove_hero(connection)
  name_delete = answer_to("Which hero would you like to remove?")
  connection.exec("DELETE FROM superheroes WHERE superhero_name = '#{name_delete}'")
end

while true
  menu_options
  response = gets.chomp.downcase
  break if response == 'q'
  case response
  when 'i'
    list_heroes(superhero_conn)
  when 'c'
    add_hero(superhero_conn)
  when 'r'
    view_info(superhero_conn)
  when 'u'
    update_hero(superhero_conn)
  when 'd'
    remove_hero(superhero_conn)
  end
end


