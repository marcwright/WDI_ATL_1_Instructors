require 'pry'
grand_character_array = []

wizard_database = File.new("potter.csv", "r")
	wizard_database.each_line do |line|
		character_data = line.chomp.split(",")
		grand_character_array.push ({:mentions => character_data[0],
							:name => character_data[1],
							:house => character_data[2]})
	end
wizard_database.close


# part 1 - Complete
def gets_all_names(array)
	names = array.map do |hash|
  		hash[:name]
  	end
  	return names
end

# Part 2 - Complete
def mention_count(array)
	more_than_500 = array.select do |how_many|
		how_many[:mentions].to_i > 500
	end
	return more_than_500
end

#Part 3 - Complete
def represented_houses(array)
houses = array.map do |hash|
  		hash[:house]
  	end
	houses = houses.delete_if do |value|
		value == nil
 	end
	return houses.uniq
end

#Part 4 -- Complete
def single_name_characters(array)
	one_name = array.map do |hash|
		if !hash[:name].include?(" ")
  			hash[:name]
  	end
 end
	one_name = one_name.delete_if do |value|
		value == nil
	end
	return one_name
end

#Part 5 - Complete
def how_many_hufflepuffs(array)
	hufflepuff_counter = 0
	array.each do |hash|
		if hash[:house] == "Hufflepuff"
			hufflepuff_counter += 1
		end
		end
	return hufflepuff_counter
end

# Part 6 - Complete
def dirty_snakes(array)
	all_names_bad_snakes = array.map do |hash|
		if hash[:house] == "Slytherin"
	  	   hash[:name].reverse
	  	else
	  		hash[:name]
	  end
	end
	return all_names_bad_snakes
end

#Part 7 -- IP
def who_gryffindor(array)
	gryff_initial_array = array.map do |hash|
		if hash[:house] == "Gryffindor"
			hash[:name]
		end
	end
	gryff_initial_array = gryff_initial_array.delete_if do |value|
		value == nil
	end
	gryff_secondary_array = gryff_initial_array.map do |value|
		value.split(" ")		
	end
return gryff_secondary_array
	# gryff_secondary_array = gryff_secondary_array.uniq
	# # end
	# # return gryff_secondary_array
end

#Part 8 - IP
def those_darn_weasleys(array)
	weasley_initial_array = array.map do |hash|
		if hash[:name].include?("Weasley")
			hash[:name]
		end
	end
	weasley_initial_array = weasley_initial_array.delete_if do |value|
		value == nil
	end
	weasley_secondary_array = weasley_initial_array.map do |value|
		value.split(" ")		
	end
	weasley_terciary_array = weasley_secondary_array.map do |array|
		array.insert(1, "Badger")
	end
	weasley_final_array = weasley_terciary_array.map do |value|
		value.join(" ")
	end
	return weasley_final_array
end















response = ""
while response != "q"
puts "Please Select an option:"
puts "1 - A list of student."
puts "2 - Characters with more then 500 mentions."
puts "3 - The names of the Houses of Hogwarts."
puts "4 - Characters with single-word names."
puts "5 - Number of member of poor House Hufflepuff."
puts "6 - Names of all student (*Special feature for House Slytherin)."
puts "7 - Pain in my ass."
puts "8 - Those darn Weasleys."
puts "9 - Characters whose first names end in 'y'"
puts "(q) - To quit."
response = gets.chomp
	case response
		when "1"
			puts "The list of student names is as follows: #{gets_all_names(grand_character_array)}"
		when "2"
			puts "The characters listed more than 500 times are: #{mention_count(grand_character_array)}"
		when "3"
			puts "The houses represented are #{represented_houses(grand_character_array)}"
		when "4"
			puts "The characters who only have a single name are #{single_name_characters(grand_character_array)}"
		when "5" 
			puts "There are a total of #{how_many_hufflepuffs(grand_character_array)} of House Hufflepuff"
		when "6"
			puts "The students of all houses are #{dirty_snakes(grand_character_array)} \nPlease note: Slytherin students are backwards . . . and most likely trying to kill you"
		when "7" 
			puts "#{who_gryffindor(grand_character_array)}"
		when "8"
			puts "The Wesleys are: #{those_darn_weasleys(grand_character_array)}."
		when "9"
			puts "This functionality comming soon."			
		else
			puts "Good-Bye"
	end
end














