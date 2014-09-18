# Calls the CSV Library
require 'CSV'
require 'pry'

#char_arr = []


# file = File.new("potter.csv", "r")

# file.each_line do |character_string|
# character_minus_new_line = character_string.chomp
# arr_represent_char = character_minus_new_line.split(',')
# character = {}
# character[:mentions] = arr_represent_char[0]
# character[:name] = arr_represent_char[1]
# character[:house] = arr_represent_char[2]

# char_arr<<character #char_arr.push(character)
# binding.pry
# character
# end



# # Method parsing through CSV file

 def csv_to_array(file)
    csv = CSV::parse(File.open(file, 'r') {|f| f.read})
    columns = csv.shift
    csv.collect { |line| Hash[*columns.zip(line).flatten ] }
  end

  characters = csv_to_array('potter.csv')

# Return an array with just the names of all the characters

def char_names(character_array)

  puts name = character_array.map {|name| name["Name"]}
end
char_names(characters)


# Return an array with all the characters with more than 500 mentions.
# Each entry in the array should contain all information about that character.
#(ie `{:mentions=>18956, :name=>"Harry Potter", :house=>"Gryffindor"}`)
def popular_characters(character_array)

  puts pop_mention = character_array.select {|char| char["Mentions"].to_i > 500}

end

popular_characters(characters)



# Return an array with the names of all the houses.
#["Gryffindor", "Slytherin", "Ravenclaw", "Hufflepuff"]
def house_name(character_array)
  house_separation = character_array.uniq {|house| house["House"]}
  print house_separation.select! {|house| house["House"] || false}
  print unique_house = house_separation.map {|house| house["House"]}
end

house_name(characters)

#Return an array with all the characters with one word names.
#Each entry in the array should contain all information about that character.
#(ie `{:mentions=>1797, :name=>"Voldemort", :house=>"Slytherin"}`)

def single_names(character_array)
  puts single_name = character_array.select {|name| name["Name"].include?(" ") == false}

end

single_names(characters)

#Return the number of characters from Hufflepuff (Hint: It should be 3)

def hufflepuff (character_array)

  hufflepuff_house = character_array.select {|house| house["House"] == "Hufflepuff"}
  huffle_names = hufflepuff_house.map {|name| name["Name"]}
      # if house["House"] == "Hufflepuff"
      #   count+=1
      #   huffle_name=[]
      #   huffle_name.push(["Name"])
      #   binding.pry
      # else
      # end
    #huffle_names = hufflepuff.map {|name| name{"Name"]}
  puts "There are #{huffle_names.length} people in hufflepuff: #{huffle_names.join(", ")}."
end

hufflepuff(characters)

#Return an array with all of the character names,
#but for the characters from Slytherin, reverse their names
#(ie "Draco Malfoy" becomes "yoflaM ocarD")


def reverse(character_array)

  slyth = character_array.select {|house| house["House"] == "Slytherin"}
  slyth_names = slyth.map{|name| name["Name"]}
  rev_name = slyth_names.map {|i| i.reverse}

  #puts rev_slyth = slyth_names.reverse_each {|rev| rev }#.join(", ").reverse.split(", ").to_ary
  all_other_houses = character_array.select {|house| house["House"] != "Slytherin"}
  other_names = all_other_houses.map{|name| name["Name"]}
  puts names = rev_name + other_names
end

reverse(characters)




#Return an array with the unique last names of all the characters from
#Gryffindor (ie, print Weasley only 1 one time)

def unique_last(character_array)

  names = character_array.select do|house|
    house["House"] == "Gryffindor"
  end

  last_names = names.map do |names|
    names["Name"].split.last
  end
      puts last_names.uniq
end

unique_last(characters)


# Return an array with the names of all the Weasleys,
# but give each of them a middle name of "Badger"

def badger_badger_weasley_weasley(character_array)
      weasleys = []
  character_array.each do |wes|
    if wes["Name"].include?("Weasley")
        weasleys.push(wes["Name"])
    end
  end

  badger_weasleys = weasleys.map do |names|
    names.split(" ").join(" Badger ")
  end
  puts badger_weasleys
end

badger_badger_weasley_weasley(characters)


# Return an array with the first names
# of characters whose first names end in "y"

def y_oh_y(character_array)
    first_names = []
  character_array.each do |first|
    if first["Name"].split(" ").first.include? 'y'
        first_names.push(first["Name"])
      end
    end
  first_names
  y_first = []
    first_names.each do |lasty|
      first = lasty.split.first
      y_first.push(first)
    end

    print_y = []
    y_first.map do |last|
      if last[-1] == 'y'
          print_y.push(last)
      end
    end
puts print_y
end

y_oh_y(characters)



# =====================================
# BONUS BONUS BONUS BONUS
# BONUS BONUS BONUS BONUS
# BONUS BONUS BONUS BONUS
# BONUS BONUS BONUS BONUS
# BONUS BONUS BONUS BONUS
# BONUS BONUS BONUS BONUS
# =====================================

# Return an array with all of the characters'
# names whose name contains "ll" somewhere

def repeating_l(character_array)

  doubles = []
  character_array.select do |name|
    if name["Name"].include? 'll'
      doubles.push(name["Name"])
    end
  end
puts doubles
end

repeating_l(characters)



# Return an array with all of the characters' names
# whose name contains multiple k's


def multi_k(character_array)
  all_the_ks = []
  character_array.select do |name|
    if name["Name"].downcase.count('k') > 1
    all_the_ks.push(name["Name"])
  end
  end
  puts all_the_ks

end

multi_k(characters)


# Return an array with all of the characters whose first
# name begins with the same letter as their last name,
# sorted alphabetically (ie "Bathilda Bagshot". Note:
# "Nearly Headless Nick" counts here!)

def similar_letters(character_array)
  same_letters = []
  character_array.select do |name|
    if name["Name"].include?(" ") == true && name["Name"].split.first[0] == name["Name"].split.last[0]
      same_letters.push(name["Name"])
    end
  end
  puts same_letters
end


similar_letters(characters)
