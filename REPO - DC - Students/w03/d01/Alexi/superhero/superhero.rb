require 'pg'

superhero_conn = PG.connect(:dbname => 'superhero_db', :host => 'localhost')

# file = File.new("superhero.csv", "a+")

#==============================#
#======Helper Methods==========#
#==============================#

def get_answer_to(question)
  puts question
  answer = gets.chomp
  return answer
end

# 1
def list_heroes(connect)
  results                 = connect.exec("SELECT name FROM superhero ORDER BY name ASC;").values
  puts " "
  puts results
  puts " "
end

# 2
def add_hero(connect)


  query                   = "INSERT INTO superhero (name, alter_ego, has_cape, power, arch_nemesis) VALUES ('#{name_input}', '#{alter_ego_input}', '#{has_cape_input}', '#{power_input}', '#{arch_nemesis_input}');"
  connect.exec(query)
end

#3
def hero_lookup(connect)
  name_input              = get_answer_to("Which superhero would you like to lookup?")
  lookup                  = connect.exec("SELECT * FROM superhero WHERE name = '#{name_input}';")
  puts " "
  puts lookup.values
  puts " "
end

# def hero_update(connect)
#   #UPDATE [table_name] SET [attribute] = 'new value' WHERE name = ['entry'];
#   name_input              = get_answer_to("What is the superhero name?")
#   alter_ego_input         = get_answer_to("What is the alter ego?")
#   has_cape_input          = get_answer_to("Does the superhero wear a cape?")
#   power_input             = get_answer_to("What is the supehero power?")
#   arch_nemesis_input      = get_answer_to("Who is the arch nemesis?")                          
                          
#                           = "UPDATE supehero SET "
#   #query                   = "INSERT INTO superhero (name, alter_ego, has_cape, power, arch_nemesis) VALUES ('#{name_input}', '#{alter_ego_input}', '#{has_cape_input}', '#{power_input}', '#{arch_nemesis_input}');"
#   connect.exec(query)
# end

def list_menu
  puts "Superhero Menu"
  puts "1. List all superheroes" 
  puts "2. Add a Superhero"
  puts "3. View all info for a specific Superhero"
  #puts "4. Update a superhero"
  #puts "5. Remove a superhero"
  puts "6. Quit"
end

#==============================#
#==========Menu Program========#
#==============================#

answer = "arbitrary string!"

while answer != '6'
  list_menu
  answer = gets.chomp
case answer
  when '1'
    list_heroes(superhero_conn)
  when '2'
    add_hero(superhero_conn)
  when '3'
    hero_lookup(superhero_conn)
  when '4'
    puts 4
  when '5'
    puts 5
  else
    puts 6
  end
end

superhero_conn.close

# file.each do |line|
#   superhero_name = line.split(",")
#   alter_ego = player[0].gsub("'","")
#   has_cape = player[1]
#   team = player[2]
#   games_played = player[3]
#   points = player[4]

#   sql  = "INSERT INTO players (name, age, team, games, points)"
#   sql += "VALUES ( '#{name}', '#{age}', '#{team}', '#{games_played}', '#{points}');"

#   db_conn.exec(sql)

# end

# file.close
