require 'csv'
require 'pry'

# Write a method that does each of the following:

#create character hash

f = File.new("potter.csv", "r")

char_arr = []

file.each_line do |character_string|
  char_minus_new_line = character_string.chomp
  arr_representing_char = char_minus_new_line.split(',')

  character = {}

  character[:mentions] = arr_representing_char[0]
  character[:name] = arr_representing_char[1]
  character[:house] = arr_representing_char[2]
  char_arr << character
  f.close
end

# 1. Return an array with just the names of all the characters
# use a hash

def create_name_array
  f = File.new("potter.csv", "r")
  character_array = []
  f.each_line do |character|
    character_info = character.chomp.split(",")
    character_array.push(character_info[1])
  end
  return character_array
  f.close
end

create_name_array


# * Return an array with all the characters with more than 500 mentions. Each entry in the array should contain all information about that character. (ie `{:mentions=>18956, :name=>"Harry Potter", :house=>"Gryffindor"}`)

def most_mentioned_characters
  f = File.new("potter.csv", "r")
  character_array = []
  f.each_line do |character|
    character_info = character.chomp.split(",")
    if character_info[0].to_i > 500
      character_array.push(character)
   end
  end
  return character_array
  f.close
end

most_mentioned_characters

# * Return an array with the names of all the houses. `["Gryffindor", "Slytherin", "Ravenclaw", "Hufflepuff"]`

def display_houses
  f = File.new("potter.csv", "r")
  character_array = []
  f.each_line do |character|
    character_info = character.chomp.split(",")
    character_array.push(character_info[2])
  end
  return character_array.uniq
  f.close
end

display_houses

# * Return an array with all the characters with one word names. Each entry in the array should contain all information about that character. (ie `{:mentions=>1797, :name=>"Voldemort", :house=>"Slytherin"}`)

def find_one_name
  f = File.new("potter.csv", "r")
  character_array = []
  f.each_line do |character|
    character_info = character.chomp.split(",")
    unless character_info[1].include?(" ")
    character_array.push(character_info)
    end
  end
  return character_array
  f.close
end

find_one_name

# * Return the number of characters from Hufflepuff (Hint: It should be 3)

def return_hufflepuff
  f = File.new("potter.csv", "r")
  character_array = []
  f.each_line do |character|
    character_info = character.chomp.split(",")
    character_array.push(character_info[2])
  end
  return character_array.count("Hufflepuff")
  f.close
end

return_hufflepuff

# * Return an array with all of the character names, but for the characters from Slytherin, reverse their names (ie "Draco Malfoy" becomes "yoflaM ocarD")

def reverse_slytherin
  f = File.new("potter.csv", "r")
  character_array = []
  f.each_line do |character|
    character_info = character.chomp.split(",")
    if character_info[2] == "Slytherin"
    character_array.push(character_info[1].reverse)
    end
  end
  return character_array
  f.close
end

reverse_slytherin

# * Return an array with the unique last names of all the characters from Gryffindor (ie, print Weasley only 1 one time)

def return_lastnames_gryffindor
  f = File.new("potter.csv", "r")
  character_array = []
  f.each_line do |character|
    character_info = character.chomp.split(",")
    if character_info[2] == "Gryffindor"
    split_name = character_info[1].chomp.split(" ")
    character_array.push(split_name[1])
    end
  end
  return character_array.uniq
  f.close
end

puts return_lastnames_gryffindor

# * Return an array with the names of all the Weasleys, but give each of them a middle name of "Badger"

def badger_weasley
  f = File.new("potter.csv", "r")
  character_array = []
  f.each_line do |character|
    character_info = character.chomp.split(",")
    split_name = character_info[1].chomp.split(" ")
    character_array.push(split_name[1])
    end
  end
  return character_array.uniq
  f.close
end

puts badger_weasley

# * Return an array with the first names of characters whose first names end in "y"
