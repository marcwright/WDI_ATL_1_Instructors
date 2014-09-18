require 'pry'

chars = []

f = File.new("potter.csv", "r")
    f.each_line do |line|
      lines = line.chomp.split(",")
      chars.push({:mentions => lines[0].to_i,
        :name => lines[1],
        :house => lines[2]})
    end
f.close

def get_names(characters)
  names = characters.map do |character|
    character[:name]
  end
  return names
end

def get_fivehundred(characters)
  five = characters.select do |character|
    character[:mentions] > 500
  end
  return five
end

def get_houses(characters)
  houses = characters.map do |character|
    character[:house]
  end
  return houses.compact.uniq
end

def get_single_names(characters)
  single_name = characters.select do |character|
    character[:name].include?(" ") == false
  end
end

def get_hufflepuffs(characters)
  count = 0
  characters.each do |character|
    if character[:house] == "Hufflepuff"
      count += 1
    end
  end
  return count
end

def reverse_slytherin(characters)
  reversed = characters.map do |character|
    if character[:house] == "Slytherin"
      character[:name].reverse!
    else
      character[:name]
    end
  end
  return reversed
end

def get_unique_lasts(characters)
  gryffindor = characters.select do |character|
    character[:house] == "Gryffindor"
  end
  lasts = gryffindor.map do |name|
    name[:name].split(" ").last
  end

  return lasts.uniq
end

def badger_weasleys(characters)
  weasleys = characters.select do |character|
    character[:name].include?("Weasley")
  end

  badgers = weasleys.map do |weasley|
    weasley[:name].split(" ").insert(1, "Badger").join(" ")
  end

  return badgers
end

def ends_in_y(characters)
  firsts = characters.map do |character|
    character[:name].split(" ").first
  end
  why = firsts.select do |first|
    first[-1] == "y"
  end
  return why
end

def ll_cool_string(characters)
  cool_string = characters.select do |char|
      char[:name].include?("ll")
  end

  cool = cool_string.map do |string|
    string[:name]
  end
  return cool
end

def okay_okay_okay(characters)
  kay = characters.map do |character|
    if character[:name].include?("k")
      character[:name]
    end
  end

  kay.compact!
  kays = kay.select do |name|
    name.downcase.count("k") > 1
  end

  return kays
end

binding.pry
