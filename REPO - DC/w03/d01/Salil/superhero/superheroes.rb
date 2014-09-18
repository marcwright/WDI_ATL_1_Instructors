require 'pg'
require "pry"
selection = ""

db_conn = PG.connect(:dbname => 'superheroes_db', :host => 'localhost')


def list_superheroes(db)
  puts db.exec("SELECT superhero_name FROM superheroes").values
end

def add_superhero(db)
  puts "Name?"
  name = gets.chomp.capitalize
  puts "Alter Ego?"
  alter = gets.chomp.capitalize
  cape = nil
  while cape == nil
    puts "Cape? (Y or N)"
    answer = gets.chomp.downcase
    if answer == "y"
      cape = true
    elsif answer == "n"
      cape = false
    else
      puts "Invalid input. Please try again"
    end
  end
  puts "Power?"
  power = gets.chomp.capitalize
  puts "Arch Nemesis?"
  nemesis = gets.chomp.capitalize
  db.exec("INSERT INTO superheroes (superhero_name, alter_ego, has_cape, power, arch_nemesis) VALUES ('#{name}', '#{alter}', '#{cape}', '#{power}', '#{nemesis}')")
  puts db.exec("SELECT superhero_name FROM superheroes").values
end

def view_superhero(db)
  puts db.exec("SELECT superhero_name FROM superheroes").values
  print "Please select a hero: "
  hero = gets.chomp
  puts db.exec("SELECT * FROM superheroes WHERE superhero_name = '#{hero}'").values
end

def update_superhero(db)
  puts db.exec("SELECT superhero_name FROM superheroes").values
  print "Please select a hero: "
  hero = gets.chomp
  puts "(1) to update name"
  puts "(2) to update alter-ego"
  puts "(3) to update cape"
  puts "(4) to update power"
  puts "(5) to update arch-nemesis"
  answer = gets.to_i
  case answer
  when 1
    print "Please enter an updated name: "
    name = gets.chomp.capitalize
    db.exec("UPDATE superheroes SET superhero_name='#{name}' WHERE superhero_name = '#{hero}';")
    puts db.exec("SELECT superhero_name FROM superheroes").values
  when 2
    print "Please enter an updated alter-ego: "
    ego = gets.chomp.capitalize
    db.exec("UPDATE superheroes SET alter_ego='#{ego}' WHERE superhero_name = '#{hero}';")
    puts db.exec("SELECT alter_ego FROM superheroes").values
  when 3
    print "Please enter an updated cape status (true or false): "
    cape = gets.chomp
    db.exec("UPDATE superheroes SET has_cape = '#{cape} WHERE superhero_name = '#{hero}';")
    puts db.exec("SELECT has_cape FROM superheroes").values
  when 4
    print "Please enter an updated power: "
    power = gets.chomp
    db.exec("UPDATE superheroes SET power = '#{power} WHERE superhero_name = '#{hero}';")
    puts db.exec("SELECT Power FROM superheroes").values
  when 5
    print "Please enter an updated arch-nemesis: "
    nemesis = gets.chomp
    db.exec("UPDATE superheroes SET arch_nemesis = '#{nemesis} WHERE superhero_name = '#{hero}';")
    puts db.exec("SELECT arch_nemesis FROM superheroes").values
  end
end

def delete_superhero(db)
  puts db.exec("SELECT superhero_name FROM superheroes").values
  print "Please select a hero: "
  hero = gets.chomp
  db.exec("DELETE FROM superheroes WHERE superhero_name = '#{hero}'")
  puts db.exec("SELECT superhero_name FROM superheroes").values
end

while selection != 'q'
  puts ("(I) to List all Superheroes")
  puts ("(C) to Add a superhero")
  puts ("(R) to View all info for a specific hero")
  puts ("(U) to Update a Superhero")
  puts ("(D) to Delete a Superhero")
  puts ("(Q) to Quit")
  selection = gets.chomp.downcase

  case selection
  when "i"
    list_superheroes(db_conn)
  when "c"
    add_superhero(db_conn)
  when "r"
    view_superhero(db_conn)
  when "u"
    update_superhero(db_conn)
  when "d"
    delete_superhero(db_conn)
  when "q"
    break
  else
    puts "Invalid input. Please select again"
  end

end





