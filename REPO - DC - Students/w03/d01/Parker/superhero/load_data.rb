require 'pg'
require 'active_support/core_ext'
db_conn = PG.connect(dbname: 'wdi')

answer = ""

while answer != "Q"
  puts ""
  puts "Enter the letter of your selection:"
  puts ""
  puts "(I) Index - List all Super Heros"
  puts "(C) Add a Super Hero"
  puts "(R) View all info for a specific Super Hero"
  puts "(U) Update a Super Hero"
  puts "(D) Remove a Super Hero"
  puts "(Q) Quit"
  puts ""
  answer = gets.chomp.upcase

  case answer
  when "I"
    puts ""
    puts "Here is the list of superheroes:"
    puts ""
    results = db_conn.exec("SELECT * FROM superheroes;")
    results.values.each { |superhero| puts superhero[1] }
    puts ""

  when "C"
    puts ""
    puts "What is the superhero's name?"
    superhero_name = gets.chomp
    puts ""
    puts "Who is the superhero's alter ego?"
    alter_ego = gets.chomp
    puts ""
    puts "Does he/she have a cape? true/false"
    has_cape = gets.chomp
    puts ""
    puts "What is his/her power?"
    power = gets.chomp
    puts ""
    puts "Who is his/her arch-nemesis?"
    arch_nemesis = gets.chomp
    puts ""

    insert = db_conn.exec("INSERT INTO superheroes (superhero_name, alter_ego, has_cape, power, arch_nemesis) VALUES ('#{superhero_name}', '#{alter_ego}', '#{has_cape}', '#{power}', '#{arch_nemesis}');")

  when "R"
    puts ""
    puts "Enter the name of the superhero you would like to view."
    puts ""

    results = db_conn.exec("SELECT * FROM superheroes;")
    results.values.each { |superhero| puts superhero[1] }
    puts ""
    superhero_selected = gets.chomp.titleize
    puts ""

    results.values.each do |superhero|
      if superhero[1] == superhero_selected
        puts "Name: #{superhero[1]}"
        puts "Alter Ego: #{superhero[2]}"
        puts "Has a Cape (true/false): #{superhero[3]}"
        puts "Power: #{superhero[4]}"
        puts "Arch Nemesis: #{superhero[5]}"
      end
    end

  when "U"
    puts ""
    puts "Enter the name of the superhero you would like to update."
    puts ""

    results = db_conn.exec("SELECT * FROM superheroes;")
    results.values.each { |superhero| puts superhero[1] }
    puts ""
    superhero_selected = gets.chomp.titleize
    puts ""

    results.values.each do |superhero|
      if superhero[1] == superhero_selected
        puts ""
        puts "What is the superhero's updated name?"
        superhero_name = gets.chomp
        puts ""
        puts "Who is the superhero's alter ego?"
        alter_ego = gets.chomp
        puts ""
        puts "Does he/she have a cape? true/false"
        has_cape = gets.chomp
        puts ""
        puts "What is his/her power?"
        power = gets.chomp
        puts ""
        puts "Who is his/her arch-nemesis?"
        arch_nemesis = gets.chomp
        puts ""

        update = db_conn.exec("UPDATE superheroes SET superhero_name = '#{superhero_name}', alter_ego = '#{alter_ego}', has_cape = '#{has_cape}', power = '#{power}', arch_nemesis = '#{arch_nemesis}' WHERE superhero_name = '#{superhero_selected}';")
      end
    end

  when "D"
    puts ""
    puts "Enter the name of the superhero you would like to remove."
    puts ""

    results = db_conn.exec("SELECT * FROM superheroes;")
    results.values.each { |superhero| puts superhero[1] }
    puts ""
    superhero_selected = gets.chomp.titleize
    puts ""

    delete = db_conn.exec("DELETE FROM superheroes WHERE superhero_name = '#{superhero_selected}';")

    puts "#{superhero_selected} has been removed."
    puts ""

  when "Q"
    puts ""
    puts "Later, Gator!"
  end
end