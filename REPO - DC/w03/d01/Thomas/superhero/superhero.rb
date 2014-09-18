require 'pg'
sh_conn = PG.connect(dbname: 'superhero_db', host: 'localhost')

def index_superheroes(connect)
  results = connect.exec("SELECT superhero_name FROM heros;")
  puts ""
  puts results.values
end

def add_superhero(connect)
  puts "What is the superhero's name?"
  superhero_name = gets.chomp
  puts "What is the superhero's alter-ego?"
  alter_ego = gets.chomp
  puts "Does the superhero have a cape (true or false)?"
  has_cape = gets.chomp
  puts "What is the superhero's power?"
  power = gets.chomp
  puts "Who is the superhero's arch-nemesis?"
  arch_nemesis = gets.chomp
  connect.exec("INSERT INTO heros (superhero_name, alter_ego, has_cape, power, arch_nemesis) VALUES ('#{superhero_name}', '#{alter_ego}', '#{has_cape}', '#{power}', '#{arch_nemesis}');")
end

def view_info(connect)
  puts ""
  puts "Choose from the below list of superheroes to view their stats:"
  index_superheroes(connect)
  puts ""
  choice = gets.chomp
  results = connect.exec("SELECT * FROM heros WHERE superhero_name = '#{choice}';")
  puts ""
  puts "name: #{results.values[0][1]}, alter-ego: #{results.values[0][2]}, cape: #{(results.values[0][3]).to_s}, power: #{results.values[0][4]}, arch-nemesis: #{results.values[0][5]}"
  puts ""
end

def update_superhero(connect)
  puts ""
  puts "Select which superhero would you like to update:"
  puts ""
  index_superheroes(connect)
  puts ""
  choice = gets.chomp
  puts ""
  results = connect.exec("SELECT * FROM heros WHERE superhero_name = '#{choice}';")
  puts ""
  puts "name: #{results.values[0][1]}, alter-ego: #{results.values[0][2]}, cape: #{(results.values[0][3]).to_s}, power: #{results.values[0][4]}, arch-nemesis: #{results.values[0][5]}"
  puts ""
  puts "Select which attribute you would like to modify"
  attribute = gets.chomp
    case attribute
      when "name"
        puts "Submit name modification"
        mod_name = gets.chomp
        connect.exec("UPDATE heros SET superhero_name = '#{mod_name}' WHERE superhero_name = '#{choice}';")
      when "alter_ego"
        puts "Submit alter_ego modification"
        mod_ego = get.chomp
        connect.exec("UPDATE heros SET alter_ego = '#{mod_ego}' WHERE superhero_name = '#{choice}';")
      when "cape"
        puts "Submit cape modification"
        mod_cape = gets.chomp
        connect.exec("UPDATE heros SET has_cape = '#{mod_cape}' WHERE superhero_name = '#{choice}';")
      when "power"
        puts "Submit power modification"
        mod_power = gets.chomp
        connect.exec("UPDATE heros SET power = '#{mod_power}' WHERE superhero_name = '#{choice}';")
      when "arch-nemesis"
        puts "Submit arch-nemesis modification"
        mod_nemesis = gets.chomp
        connect.exec("UPDATE heros SET arch_nemesis = '#{mod_nemesis}' WHERE superhero_name = '#{choice}';")
      else
        puts "please provide attribute without trailing semicolon"
    end

end

def remove_superhero(connect)
  puts ""
  puts "Select which superhero would you like to remove:"
  puts ""
  index_superheroes(connect)
  puts ""
  choice = gets.chomp
  puts ""
  results = connect.exec("DELETE FROM heros WHERE superhero_name = '#{choice}';")
  puts ""
end

def list_options
  puts ""
  puts "Enter the NUMBER from the list of actions below:"
  puts "1. Index - List all Super Heros"
  puts "2. Add a Super Hero"
  puts "3. View all info for a specific Super Hero"
  puts "4. Update a Super Hero"
  puts "5. Remove a Super Hero"
  puts "6. Quit"
  puts ""
end

answer = "arbitrary string!"

#why do the below number options need to be listed as strings?
while answer != '6'
  list_options
  answer = gets.chomp

  case answer
    when '1'
      index_superheroes(sh_conn)
    when '2'
      add_superhero(sh_conn)
    when '3'
      view_info(sh_conn)
    when '4'
      update_superhero(sh_conn)
    when '5'
      remove_superhero(sh_conn)
    when '6'
      puts "goodbye"
    else
      puts "You did not provide a valid response"
  end
end
