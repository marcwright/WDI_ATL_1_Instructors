require 'pry'

#Change the 'csv' file into an array.
characters= []
p = File.new("potter.csv", "r")

p.each_line do |line|
  names = line.chomp.split(",")
  characters.push({:mentions => names[0].to_i,
    :name => names[1], :house => names[2]})
end

p.close

#1. List the names of all the characters.
def just_names(list)
  names = list.map do |c|
    c[:name]
  end
  return names
end

#puts just_names(characters)

#2. List the characters with more than 500 mentions.
def greater_than_500(list)
  gtf = list.select do |c|
    c[:mentions] > 500
  end
  return gtf
end

#3. List the names of all the houses
def house_names(list)
  houses = list.map do |c|
    c[:house]
  end
  return houses.uniq
end

#4. List the names of the characters with one-word names.
def one_word_names(list)
  own = list.select do |c|
    c[:name].include?(" ") == false
  end
  return own
end

#5. The number of characters from Hufflepuff.
def hufflepuff(list)
end

#6. List the names of all the characters, with the Slytherin names reversed.
def slytherin_reverse(list)
  sly_list = list.map do |c|
    if c[:house] == "Slytherin"
      c[:name].reverse
    else
      c[:name]
    end
  end
  return sly_list
end

#7. List each unique Griffindor last name.
def ugln(list)
  griffindor = list.select do |c|
    c[:house] == "Griffindor"
  end

  last_names = griffindor.map do |c|
    c[:name].split(" ").last
  end
  return last_names.uniq
end

# #8. List the names of all of the Weasleys, with Badger as their middle name.
# def badger_weasleys(list)
# end

# #9. List all of the characters whose first names end in y.
# def first_name_end_in_y(list)
# end
# binding.pry






