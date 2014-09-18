# # Book 8: Harry Potter and the Comma-Separated Value

# Included is a `potter.csv` file with a bunch of Harry Potter data. Each line contains the number of times a certain character was mentioned in the Harry Potter series, along with their name and---in some cases---the house they are associated with. Your job will be to slice and dice the data in a variety of ways using File I/O, Arrays & Hashes, Enumeration, and String Manipulation.

# ### Learning Objectives:

# * Practice thinking about how to structure data
# * Get some exposure to File I/O in Ruby by grabbing data from the `potter.csv` file.

# Write a method that does each of the following:

# 1. Return an array with just the names of all the characters
# * Return an array with all the characters with more than 500 mentions. Each entry in the array should contain all information about that character. (ie `{:mentions=>18956, :name=>"Harry Potter", :house=>"Gryffindor"}`)
# * Return an array with the names of all the houses. `["Gryffindor", "Slytherin", "Ravenclaw", "Hufflepuff"]`
# * Return an array with all the characters with one word names. Each entry in the array should contain all information about that character. (ie `{:mentions=>1797, :name=>"Voldemort", :house=>"Slytherin"}`)
# * Return the number of characters from Hufflepuff (Hint: It should be 3)
# * Return an array with all of the character names, but for the characters from Slytherin, reverse their names (ie "Draco Malfoy" becomes "yoflaM ocarD")
# * Return an array with the unique last names of all the characters from Gryffindor (ie, print Weasley only 1 one time)
# * Return an array with the names of all the Weasleys, but give each of them a middle name of "Badger"
# * Return an array with the first names of characters whose first names end in "y"

# ### Bonus

# * Return an array with all of the characters' names whose name contains "ll" somewhere
# * Return an array with all of the characters' names whose name contains multiple k's
# * Return an array with all of the characters whose first name begins with the same letter as their last name, sorted alphabetically (ie "Bathilda Bagshot". Note: "Nearly Headless Nick" counts here!)

# ### Tips:
# * Try to minimize your use of ".each". In most of these cases, there will be another enumerable method that will be a better tool for the job!
# * Ruby Docs for Array, String, and Enumerable are you friend!

# ---
# ###### Written by Peter Lai

potter_data_file = File.open "potter.csv"

  # returns an array of Hashes with the keys, mentions, name, house
  potter_data = potter_data_file.readlines.map do |char_data|
    field_values = char_data.chomp.split(',')
    Hash[[:mentions, :name, :house].zip field_values]
  end

  character_names = potter_data.map { |char| char[:name] }
  chars_w_500_mentions = potter_data.select { |char| char[:mentions].to_i > 500 }

  unique_houses = potter_data.map { |char| char[:house] }.uniq.compact

  one_word_names = potter_data.select { |char| char[:name].split.length == 1 }

  num_hufflepuff_members = potter_data.count { |char| char[:house] == "Hufflepuff" }

  reversed_slytherin_names = potter_data.map do |char|
    char[:name].reverse! if char[:house] == "Slytherin"
    char
  end

  unique_gryffindor_surnames = potter_data.map do |char|
    if char[:house] == "Gryffindor"
      gryffindor_name = char[:name].split
      gryffindor_name[-1] unless gryffindor_name.length == 1
    end
  end.uniq.compact

  weasley_regex = /Weasley$/
  badgerfied_weasleys = potter_data.map do |char|
    char[:name].gsub(weasley_regex, "Badger Weasley") if char[:name] =~ weasley_regex
  end.compact

  first_name_ends_with_y = potter_data.map do |char|
    first_name = char[:name].split[0]
    first_name if first_name[-1] == "y"
  end.compact

  names_w_ll = potter_data.map { |char| char[:name] if char[:name] =~ /ll/ }.compact
  names_w_ks = potter_data.map { |char| char[:name] if char[:name] =~ /k.*k/ }.compact

  same_letter_first_last_names = potter_data.select do |char|
    name = char[:name].split
    name.length > 1 && name[0][0] == name[-1][0]
  end

potter_data_file.close
