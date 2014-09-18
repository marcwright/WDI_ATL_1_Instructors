require 'pg'
db_conn = PG.connect(:dbname => 'superheroes_db', :host => 'localhost')


in_operation = true

while in_operation == true
puts "\n"
puts "SUPERHERO MENU"
puts "(I) Index - List all Super Heroes"
puts "(C) Add a Super Hero"
puts "(R) View all info for a specific Super Hero"
puts "(U) Update a Super Hero"
puts "(D) Remove a Super Hero"
puts "(Q) Quit"
puts "\n"
user_input = gets.chomp.downcase

  case user_input
    when "i"
      puts db_conn.exec("SELECT superhero_name FROM superheroes").values
    when "c"
      puts "Which superhero would you like to add?"
      name = gets.chomp
      puts "What is this hero's alter ego?"
      alter_ego = gets.chomp
      puts "Does this superhero have a cape? (Y/N)"
      answer = gets.chomp.downcase
        if answer == "y"
          has_cape = true
        else
          has_cape = false
        end
      puts "What power does this hero have?"
      power = gets.chomp
      puts "What is the hero's arch-nemesis?"
      arch_nemesis = gets.chomp
      db_conn.exec("INSERT INTO superheroes (superhero_name, alter_ego, has_cape, power, arch_nemesis) VALUES ('#{name}', '#{alter_ego}', #{has_cape}, '#{power}', '#{arch_nemesis}')")
    when "r"
      puts "Which hero would you like to see?"
      puts db_conn.exec("SELECT superhero_name FROM superheroes").values
      ans = gets.chomp
      puts db_conn.exec("SELECT * FROM superheroes WHERE superhero_name ='#{ans}'").values
    when "u"
      puts "Which hero would you like to update?"
      puts db_conn.exec("SELECT superhero_name FROM superheroes").values
      ans = gets.chomp
      puts "Enter new value for alter ego"
      alt_ego = gets.chomp
      puts db_conn.exec("UPDATE superheroes WHERE alter_ego = '#{alt_ego}'")
      puts "Enter new value for cape status (Y for yes, s/he wears a cape. N for no.)"
      cape = gets.chomp.downcase
      if answer == "y"
        cape = true
      else
        cape = false
      end
      puts db_conn.exec("UPDATE superheroes WHERE has_cape = '#{cape}'")
      puts "Enter new value for their powers"
      power = gets.chomp
      puts db_conn.exec("UPDATE superheroes WHERE power = '#{power}'")
      puts "Enter new value for their arch-nemesis"
      nemesis = gets.chomp
      puts db_conn.exec("UPDATE superheroes WHERE arch_nemesis = '#{nemesis}'")
    when "d"
      puts "Which hero would you like to remove?"
      puts db_conn.exec("SELECT superhero_name FROM superheroes").values
      rmvd = gets.chomp
      db_conn.exec("DELETE FROM superheroes WHERE superhero_name = '#{rmvd}'")
      puts "Superhero successfully removed."
    when "q"
      in_operation = false
  end
end
