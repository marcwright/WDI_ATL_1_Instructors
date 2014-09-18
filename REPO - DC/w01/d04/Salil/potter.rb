require 'csv'
require 'pry'
temporary = []
characters_hash = []
count = 0;
f = File.new("potter.csv", "r")
      f.each_line do |line|
        temporary = line.chomp.split(",")
        if temporary.length > 2
          characters_hash[count] = {:mention => temporary[0].to_i, :name => temporary[1], :house => temporary[2]}
        else
          characters_hash[count] = {:mention => temporary[0].to_i, :name => temporary[1]}
        end
        count += 1
      end
f.close


def num_mentions(characters)
  characters.each do |character|
   if character[:mention] >= 500 && character.length > 2
      puts "#{character[:mention]}, #{character[:name]}, #{character[:house]}"
    elsif character[:mention] >= 500
      puts "#{character[:mention]}, #{character[:name]}"
    end
  end
end

def one_name(characters)
  characters.each do |character|
   if character[:name].split(" ").length < 2
      puts "#{character}"
    end
  end
end

def huff_people(characters)
  huff_count = 0
  characters.each do |character|
   if character[:house] == "Hufflepuff"
      puts "#{character[:name]}"
      huff_count += 1
    end
  end
  puts "There are #{huff_count} people in Hufflepuff"
end

def reverse_Slytherin(characters)
  characters.each do |character|
   if character[:house] == "Slytherin"
      puts "#{character[:name].reverse}"
    end
  end
end

def uniq_house(characters)
  house_types = characters.map do |character|
    character[:house]
  end
  puts house_types.uniq.compact!
end


def uniq_gryff(characters)
  names = []
  count = 0
  characters.map do |character|
    if character[:house] == "Gryffindor"
       names[count] = character[:name].split(" ")[1]
    end
    count += 1
  end
  puts names.uniq.compact!
end

def weasel_badger(characters)
  characters.map do |character|
    if character[:name].include?("Weasley")
      weasel = character[:name].split(" ")
      weasel.insert(1, "Badger")
      puts weasel.join(" ")
    end
  end
end

def y_so_srs(characters)
  characters.map do |character|
    if character[:name].split(" ")[0].reverse.chr == "y"
      y = character[:name].split(" ")[0]
      puts y
      binding.pry
    end
  end
end





#puts characters_hash.select { |character| character[:house] == "white"}

# puts characters_hash

num_mentions(characters_hash)
one_name(characters_hash)
huff_people(characters_hash)
reverse_Slytherin(characters_hash)
uniq_house(characters_hash)
uniq_gryff(characters_hash)
weasel_badger(characters_hash)
y_so_srs(characters_hash)
