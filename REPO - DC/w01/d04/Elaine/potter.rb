#require 'pry'


# Collects all lines into hashes in an array.
f = File.new("potter.csv", "r")

characters = []

f.each_line do |line|
  characters.push({
    :mentions => line.chomp.split(",")[0],
    :name => line.chomp.split(",")[1],
    :house => line.chomp.split(",")[2]
  })
end


# 1. Return an array with just the names of all the characters

def names_only(characters)
  characters.map do |each_character|
    each_character[:name]
  end
end

character_names = names_only(characters)

puts ""
puts "Answer 1:"
print character_names
puts ""


# 2. Return an array with all the characters with more than 500 mentions. Each entry in the array should contain all information about that character.

def characters_over_500(characters)
  characters.select do |each_character|
    each_character[:mentions].to_i > 500
  end
end

over_500_names = characters_over_500(characters)

puts ""
puts "Answer 2:"
print over_500_names
puts ""

# 3. Return an array with the names of all the houses.

def all_houses(characters)
  characters.map do |each_character|
    each_character[:house]
  end
end

houses_names = all_houses(characters).uniq.compact

puts ""
puts "Answer 3:"
puts houses_names


# 4. Return an array with all the characters with one word names. Each entry in the array should contain all information about that character.

def one_word_names(characters)
  characters.select do |each_character|
    !each_character[:name].include?(" ")
  end
end

one_word_characters = one_word_names(characters)

puts ""
puts "Answer 4:"
print one_word_characters
puts ""



# 5. Return the number of characters from Hufflepuff (Hint: It should be 3)

def from_hufflepuff(characters)
  characters.select do |each_character|
    each_character[:house]==("Hufflepuff")
  end
end

hufflepuff_characters = from_hufflepuff(characters)

puts ""
puts "Answer 5:"
puts hufflepuff_characters.length

# 6. Return an array with all of the character names, but for the characters from Slytherin, reverse their names (ie "Draco Malfoy" becomes "yoflaM ocarD")

def reverse_slytherin(characters)
  characters.map do |each_character|
    if each_character[:house] != "Slytherin"
      each_character[:name]
    elsif each_character[:house] == "Slytherin"
      (each_character[:name]).reverse
    else
    end
  end
end

slytherin_names_reversed = reverse_slytherin(characters)

puts ""
puts "Answer: 6"
print slytherin_names_reversed
puts""


# 7. Return an array with the unique last names of all the characters from Gryffindor (ie, print Weasley only 1 one time)

def gryffindor_characters(characters)
  characters.select do |each_character|
    each_character[:house]==("Gryffindor")
  end
end

gryffindor_names = gryffindor_characters(characters)

def gryffindor_lastnames(characters)
  characters.map do |each_character|
    each_character[:name].split.last
  end
end

last_names = gryffindor_lastnames(gryffindor_names).uniq

puts ""
puts "Answer: 7"
puts last_names



# 8. Return an array with the names of all the Weasleys, but give each of them a middle name of "Badger"

def weasleys(characters)
  characters.select do |each_character|
    each_character[:name].include?("Weasley")
  end
end

weasley_characters = weasleys(characters)

def weasley_names(characters)
  characters.map do |each_character|
    each_character[:name].split(" ").insert(1, " Badger ").join

  end
end

all_weasleys = weasley_names(weasley_characters)

puts ""
puts "Answer: 8"
puts all_weasleys


# 9. Return an array with the first names of characters whose first names end in "y"

def names_end_y(characters)
  characters.map do |each_character|
    if each_character[:name].split(" ")[0].end_with?("y")
      each_character[:name].split(" ")[0]
    else
    end
  end
end

y_ending_names = names_end_y(characters).compact

puts ""
puts "Answer: 9"
puts y_ending_names

# binding.pry

f.close
