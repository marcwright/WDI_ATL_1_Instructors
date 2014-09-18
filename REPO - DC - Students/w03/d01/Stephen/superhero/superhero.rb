# Stephen Stanwood (stephen@stanwoodsolutions.com)

require 'pg'
require 'CSV'

COMMANDS = ['I', 'C', 'R', 'U', 'D', 'P', 'Q']
ATTRIBUTES = ["superhero_name", "alter_ego", "has_cape",
              "power", "arch_nemesis"]
FILEPATH = "superheroes.csv"
DB = PG.connect(dbname: "superhero_db")
DB.exec("DROP TABLE IF EXISTS superheroes;")
DB.exec("CREATE TABLE superheroes (
           id serial PRIMARY KEY,
           superhero_name VARCHAR(100) NOT NULL,
           alter_ego VARCHAR(100) NOT NULL,
           has_cape BOOLEAN NOT NULL,
           power VARCHAR(100) NOT NULL,
           arch_nemesis VARCHAR(100) NOT NULL);")

# Displays a header that presents user with the program options
def print_header
  puts "(I) Index - List all Super Heros"
  puts "(C) Add a Super Hero"
  puts "(R) View all info for a specific Super Hero"
  puts "(U) Update a Super Hero"
  puts "(D) Remove a Super Hero"
  puts "(P) Remove all of the caped heroes"
  puts "(Q) Quit"
end

# Reads in superhero data from a CSV file, inserting line by line
def read_data
  CSV.foreach(FILEPATH) do |row|
    insert_hero(row)
  end
end

# Inserts a new superhero into the table with specified attributes
def insert_hero(attrs)
  DB.exec("INSERT INTO superheroes
              (superhero_name, alter_ego, has_cape, power, arch_nemesis)
           VALUES
              ('#{attrs[0]}', '#{attrs[1]}', #{attrs[2]},
               '#{attrs[3]}', '#{attrs[4]}');")
end

# Prompts a user with a specified query until they enter a valid command
def prompt(query)
  while true
    print query + " "
    resp = gets.chomp[0].upcase
    return resp if (COMMANDS.include? resp)
  end
end

# Prompts a user for a superhero's name and returns the response
def prompt_superhero
  print "==> Which superhero? "
  return gets.chomp.split.map(&:capitalize).join(' ')
end

# Prompts the user for each attribute for a superhero, then returns them
def prompt_attrs
  resp_attrs = []
  ATTRIBUTES.each do |attr|
      print "#{attr}? "
      resp_attrs[ATTRIBUTES.index(attr)] = gets.chomp
    end
  return resp_attrs
end

# Displays a list of all of the superheroes
def list
  puts DB.exec("SELECT * FROM superheroes;").values
end

# Allows a user to create a superhero
def create
  insert_hero(prompt_attrs)
end

# Displays all of the information for a particular superhero
def details
  puts DB.exec("SELECT * FROM superheroes WHERE superhero_name = '#{prompt_superhero}';").values
end

# Allows a user to update a superhero's record in the database
def update
  attrs = prompt_attrs
  DB.exec("UPDATE superheroes
           SET
            superhero_name = '#{attrs[0]}',
            alter_ego = '#{attrs[1]}',
            has_cape = #{attrs[2]},
            power = '#{attrs[3]}',
            arch_nemesis = '#{attrs[4]}'
           WHERE superhero_name = '#{attrs[0].split.map(&:capitalize).join(' ')}';")
end

# Allows a user to remove a specified superhero
def remove
  DB.exec("DELETE FROM superheroes WHERE superhero_name = '#{prompt_superhero}';")
end

# Deletes all of the caped superheroes
def caped
  DB.exec("DELETE FROM superheroes WHERE has_cape = TRUE;")
end

puts "Wecome to SuperBase (not the Nicki Minaj song)!\n"
read_data

while true
  print_header
  action = prompt("What do you want to do?")
  puts

  break if action == 'Q'

  case action
  when 'I'
    list
  when 'C'
    create
  when 'R'
    details
  when 'U'
    update
  when 'D'
    remove
  when 'P'
    caped
  end

  puts
end

DB.close
puts "Have a great day!"
