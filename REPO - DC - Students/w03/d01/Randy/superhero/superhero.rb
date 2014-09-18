require 'pry'
require 'pg'
sh_conn = PG.connect(dbname: 'superheros_db', host: 'localhost')

def ask_question(question)
puts question
answer = gets.chomp
return answer
end

def list_all_heros(connection)
  puts connection.exec("SELECT superhero_name FROM heros;").values
end

def add_hero(conn)
  cape = ask_question("Does the hero have a cape? (y/n)")
    if cape.include? "y"
      cape = true
    else
      cape = false
    end
  conn.exec("INSERT INTO heros(superhero_name, alter_ego, has_cape, power, arch_nemesis) VALUES ('#{ask_question("What is the Heroes name?")}', '#{ask_question("What is the heroes alter-ego?")}', '#{cape}', '#{ask_question("What's the heroes power?")}', '#{ask_question("Who is the heroes arch-nemesis?")}')")
end

def specific_info(conn)
  puts conn.exec("SELECT superhero_name FROM heros;").values
  puts conn.exec("SELECT * FROM heros WHERE superhero_name = '#{ask_question("Which hero would you like to know more about?")}'").values
end

def update_hero(conn)
  puts conn.exec("SELECT superhero_name FROM heros;").values
  hero_name = ask_question("Which hero would you like to update?")
  puts "1-Name <-> 2-Alter-Ego <-> 3-Cape <-> 4-Powers <-> 5-Nemesis"
  answer = ask_question("Which attribute would you like to update?")
    case answer
      when "1"
        conn.exec("UPDATE heros SET superhero_name = '#{ask_question("What is the updated Super Hero name?")}' WHERE superhero_name = '#{hero_name}'")
      when "2"
        conn.exec("UPDATE heros SET alter_ego = '#{ask_question("What is the updated Alter-Ego?")}' WHERE superhero_name = '#{hero_name}'")
      when "3"
        cape = ask_question("Does the hero have a cape? (y/n)")
          if answer.include? "y"
            cape = true
          else
            cape = false
          end
        conn.exec("UPDATE heros SET has_cape = '#{cape}' WHERE superhero_name = '#{hero_name}'")
      when "4"
        conn.exec("UPDATE heros SET power = '#{ask_question("What is the updated power?")}' WHERE superhero_name = '#{hero_name}'")
      when "5"
        conn.exec("UPDATE heros SET arch_nemesis = '#{ask_question("Who is the updated Nemesis?")}' WHERE superhero_name = '#{hero_name}'")
      end
end

def remove_hero(conn)
  puts conn.exec("SELECT superhero_name FROM heros;").values
  conn.exec("DELETE FROM heros WHERE superhero_name = '#{ask_question("Which hero would you like to remove?")}'")
end

def no_capes!(conn)
answer = ask_question("Are you sure you want to remove all caped crusaders from this list?").downcase
  if answer.include? "y"
    conn.exec("DELETE FROM heros WHERE has_cape = 'true'")
  else
    puts "Good Call."
  end
end


response = ""
while response != 'q'
  puts "\nPlease select a menu option."
  puts "(I) Index - List all Super Heros"
  puts "(C) Add a Super Hero"
  puts "(R) View all info for a specific Super Hero"
  puts "(U) Update a Super Hero"
  puts "(D) Remove a Super Hero"
  puts "(F) Remove all heroes who have capes"
  puts "(Q) Quit"
  response = gets.chomp.downcase

  case response
    when "i"
      list_all_heros(sh_conn)
    when "c"
      add_hero(sh_conn)
    when "r"
      specific_info(sh_conn)
    when "u"
      update_hero(sh_conn)
    when "d"
      remove_hero(sh_conn)
    when "f"
      no_capes!(sh_conn)
  end
end
sh_conn.close
