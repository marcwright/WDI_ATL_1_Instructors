require 'pg'
require 'pry'

db_conn = PG.connect(dbname: 'superheroes')
results = db_conn.exec('SELECT * FROM super_heroes;')


#COPY zip_codes FROM '/path/to/csv/ZIP_CODES.txt' DELIMITER ',' CSV;



puts "------------------- menu -------------------"
puts "(I) Index - List all Super Heros            "
puts "(C) Add a Super Hero                        "
puts "(R) View all info for a specific Super Hero "
puts "(U) Update a Super Hero                     "
puts "(D) Remove a Super Hero                     "
puts "(X) Exit Program                            "
puts "--------------------------------------------"
	
counter = 0
while counter == 0


	puts " "
	puts "Please enter your menu selection:"
	puts " "

	user_input = gets.chomp # USER INPUT PROMPT

  

	if user_input == "I"
		puts "List all heroes:"
		puts results.values
		




	elsif user_input == "C"
		puts "Add a hero:"
		puts "--------------------"
		puts "superhero name :"
		new_name = gets.chomp
		puts "alter ego :"
		new_alter_ego = gets.chomp
		puts "has a cape? true or false :"
		new_has_cape = gets.chomp
		puts "power :"
		new_power = gets.chomp
		puts "arch nemesis :"
		new_nemesis = gets.chomp
		puts "--------------------"

		query = "INSERT INTO super_heroes (superhero_name, alter_ego, has_cape, power, 
			arch_nemesis) VALUES ('#{new_name}', '#{new_alter_ego}', '#{new_has_cape}',
			 '#{new_power}', '#{new_nemesis}');"
		
		insert = db_conn.exec(query)




	elsif user_input == "R"
		puts "View all info for one hero:"
		puts "Enter name:"
		hero_name = gets.chomp
		
		results = db_conn.exec("SELECT * FROM super_heroes 
			WHERE superhero_name LIKE '%#{hero_name}%';")
		puts results.values




	elsif user_input == "U"
		puts "Update a hero:"
		puts "Enter name of superhero to update:"
		hero_name = gets.chomp
		puts "Which element do you want to update?"
		puts "----------------"
		puts " superhero_name "
		puts " alter_ego      "
		puts " has_cape?      "
		puts " power          "
		puts " arch_nemesis   "
		puts "----------------"
		elem_to_update = gets.chomp
		puts "What do you want to update it to?"
		new_element_value = gets.chomp

		query = "UPDATE super_heroes SET #{elem_to_update} = '#{new_element_value}'
		WHERE superhero_name = '#{hero_name}';"

		insert = db_conn.exec(query)




	elsif user_input == "D"
		puts "Remove a hero:"
		puts "Enter name of hero to delete:"
		hero_to_delete = gets.chomp
		
		query = "DELETE FROM super_heroes WHERE superhero_name = '#{hero_to_delete}';"
		
		insert = db_conn.exec(query)

	elsif user_input == "X"
		puts "Goodbye."
		db_conn.close
		counter = 1

	else
		puts "Please enter a selection;"
		
 end
 

end
