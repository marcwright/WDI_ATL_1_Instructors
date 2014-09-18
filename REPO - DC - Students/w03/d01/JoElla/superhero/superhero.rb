require 'pry'
require 'pg'


db_conn = PG.connect(:dbname => 'superhero')

# # db_conn.exec("CREATE TABLE superheroes (
# #   id serial PRIMARY KEY,
# #   superhero_name varchar(20) NOT NULL,
# #   alter_ego varchar(20) NOT NULL,
# #   has_cape boolean NOT NULL,
# #   power varchar(20) NOT NULL,
# #   arch_nemesis varchar(20)
# #   );")

# db_conn.exec("INSERT INTO superheroes (superhero_name, alter_ego, has_cape, power, arch_nemesis) VALUES('Superman','Clark Kent',true,'strength','Lex Luthor')")

# db_conn.exec("INSERT INTO superheroes (superhero_name, alter_ego, has_cape, power, arch_nemesis) VALUES('Wonder Woman','Diana Prince',false,'strength','Cheetah')")

# db_conn.exec("INSERT INTO superheroes (superhero_name, alter_ego, has_cape, power, arch_nemesis) VALUES('Batman','Bruce Wayne',true,'intelligence','Joker')")


def get_input(question)
  puts question
  answer = gets.chomp.to_s
  return answer
end

def view_names(connex)
names = connex.exec("SELECT superhero_name FROM superheroes;").values
      names.each { |name| puts name }
end

def add_superhero(connex)
  users_superhero_name = get_input("Name of new superhero")
      users_alter_ego = get_input("Alter ego of new superhero")
      users_has_cape = get_input("Does this dude have a cape?")
      users_power = get_input("Does it have a power?")
      users_arch_nemesis = get_input("Does it have a nemesis?")

      connex.exec("INSERT INTO superheroes (superhero_name, alter_ego, has_cape, power, arch_nemesis) VALUES('#{users_superhero_name}', '#{users_alter_ego}', #{users_has_cape}, '#{users_power}', '#{users_arch_nemesis}');")

      puts "You just entered #{users_superhero_name}."
end

def view_hero(connex)
hero_to_view = get_input("Who would you like to see?")

      deets = connex.exec("SELECT * FROM superheroes WHERE superhero_name = '#{hero_to_view}'").values

      puts deets

end

def update_hero(connex)
  hero_to_update = get_input("Who do you want to update?")
  attribute_to_update = get_input("What attribute would you like to update (superhero_name, alter_ego, has_cape, power, arch_nemesis?")
  update_value = get_input("What would you like the new value to be?")
  connex.exec("UPDATE superheroes
    SET #{attribute_to_update} = '#{update_value}'
    WHERE superhero_name = '#{hero_to_update}';")

end

def delete_hero(connex)
  hero_to_delete = get_input("Who do you want to DESTROY??")

  connex.exec("DELETE FROM superheroes WHERE superhero_name = '#{hero_to_delete}'")
end


def menu
  puts "Please enter a number:"
  puts "1. List all superheroes"
  puts "2. Add a superhero"
  puts "3. View info"
  puts "4. Update a superhero"
  puts "5. Remove a superhero"
  puts "6. Quit"
end

menu()

choice = "arbitrary string!"
while choice != 6
choice = gets.chomp

  case choice
    when "1"
      view_names(db_conn)
    when "2"
      add_superhero(db_conn)
    when "3"
      view_hero(db_conn)
    when "4"
      update_hero(db_conn)
    when "5"
      delete_hero(db_conn)
    when "6"
      puts "Thanks for playing."
      choice = 6
  end
  menu()
end

