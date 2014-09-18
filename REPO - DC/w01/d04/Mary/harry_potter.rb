f = File.new("potter.csv", "r")

#from class
char_arr = []

f.each_line do |character_string|
  char_min_new_line = character_string.chomp
  arr_representing_char = char_mine_new_line.split(",")
  character = {}
  character[:mention] = arr_representing_char[0]
  character[:name] = arr_representing_char[1]
  character[:house] = arr_representing_char[2]
  char_arr.push(character)
end

# method to return an array of all character names; edited to make sense with classwork above
def character_name_array(array)
  names = array.map do |characters|
    character[:name]
  end
  return names
end

character_name_array(char_arr)

# method to return an array of all of the characters mentioned more than 500 times; edited to make sense with classwork above
def popular_character_array(array)
  popular_names = array.select do |characters|
    character[:mention].to_i > 500
  end
  return popular_names
end

popular_character_array(char_arr)

# method to return an array of all of the houses once
def hogwarts_houses
  f = File.new("potter.csv", "r")
  house_array = []
  f.each_line do |character|
    character_info = character.chomp.split(",")
    house_array.push(character_info[2])
  end
  return house_array.uniq
  f.close
end

hogwarts_houses

# method to return array of one-named character info
def one_name_characters
  f = File.new("potter.csv", "r")
  character_array = []
  f.each_line do |character|
    character_info = character.chomp.split(",")
    unless character_info[1].include?(" ")
      character_array.push(character)
    end
  end
  return character_array
  f.close
end

one_name_characters

# method to return the number of characters designated as Hufflepuff
def hufflepuff_characters
  f = File.new("potter.csv", "r")
  character_array = []
  f.each_line do |character|
    character_info = character.chomp.split(",")
    if character_info[2] == "Hufflepuff"
      character_array.push(character_info[1])
    end
  end
  return character_array.length
  f.close
end

hufflepuff_characters

# method to return array with all character names & backwards Slytherins
def slytherins_are_backwards
  f = File.new("potter.csv", "r")
  character_array = []
  f.each_line do |character|
    character_info = character.chomp.split(",")
      if character_info[2] == "Slytherin"
        character_array.push(character_info[1].reverse)
      else
        character_array.push(character_info[1])
      end
  end
  return character_array
  f.close
end

slytherins_are_backwards

# method to return array of unique Gryffindor last names
def unique_gryff_last_names
  f = File.new("potter.csv", "r")
  character_array = []
  f.each_line do |character|
    character_info = character.chomp.split(",")
      if character_info[2] == "Gryffindor"
        split_name = character_info[1].chomp.split(" ")
        character_array.push(split_name.last)
      end
  end
  return character_array.uniq
  f.close
end

unique_gryff_last_names

#method to return array of Weasleys' names with Badger as middle name
def weasleys_badger
  f = File.new("potter.csv", "r")
  weasley_array = []
  f.each_line do |character|
    character_info = character.chomp.split(",")
      if character_info[1].include?("Weasley")
        split_name = character_info[1].chomp.split(" ")
        split_name.insert(2,"Badger")
        weasley_name = split_name.join(" ")
        weasley_array.push(weasley_name)
      end
  end
  return weasley_array
  f.close
end

weasleys_badger

#method to return array of first names that end in "Y"
def first_names_end_with_y
  f = File.new("potter.csv", "r")
  character_array = []
  f.each_line do |character|
    character_info = character.chomp.split(",")
    split_name = character_info[1].chomp.split(" ")
    split_first_name = split_name[0].chomp.split("")
      if split_first_name.last == "y"
        character_array.push(split_name[0])
      end
  end
  return character_array
  f.close
end

first_names_end_with_y

f.close
