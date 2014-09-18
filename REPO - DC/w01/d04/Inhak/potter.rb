
#Method 1 - Returns names of all characters
def name_lister_file (file)
  file.each_line do |line|
    name_data = line.chomp.split(",")
    puts name_data[1]
  end
  file.close
end

def mentioned_alot (file)
  mentioned = []
    file.each_line do |line|
      name_data = line.chomp.split(",")
      if name_data[0].to_i > 500
        mentioned.push({
          mentioned: name_data[0],
          name: name_data[1],
          house: name_data[2],
        })
      end
    end
  puts mentioned
  file.close
end

def houses (file)
  houses = []
    file.each_line do |line|
      name_data = line.chomp.split(",")
      if name_data[2] != nil
        houses.push(name_data[2])
      end
    end
  puts houses.uniq
  file.close
end

def one_word_names (file)
  jesus_wizards = []
  file.each_line do |line|
    name_data = line.chomp.split(",")
    if !name_data[1].include?(" ")
      jesus_wizards.push({
          mentioned: name_data[0],
          name: name_data[1],
          house: name_data[2],
        })
    end
  end
  puts jesus_wizards
end

def huff_n_puff (file)
  count = 0
  file.each_line do |line|
    name_data = line.chomp.split(",")
    if name_data[2] == "Hufflepuff"
      count += 1
    end
  end
  puts count
end

def nirehtyls (file)
  all_wizards =[]
  file.each_line do |line|
    name_data = line.chomp.split(",")
    if name_data[2] == "Slytherin"
      all_wizards.push(name_data[1].reverse)
    else
      all_wizards.push(name_data[1])
    end
  end
  puts all_wizards
end

def gryff_families (file)
  family = []
  file.each_line do |line|
    name_data = line.chomp.split(",")
      if name_data[2] == "Gryffindor"
        trunc_names = name_data[1].split(" ")
        family.push(trunc_names[1])
      end
  end
  puts family.uniq
end

def badger_weasley (file)
  badger = []
  file.each_line do |line|
    name_data = line.chomp.split(",")
    if name_data[1].include?("Weasley")
      middle = name_data[1].split(" ")
      badger.push(middle.insert(1, "Badger").join(" "))
    end
  end
  puts badger
end

def namey (file)
  nameys = []
  file.each_line do |line|
    name_data = line.chomp.split(",")
    if name_data[1][-1] == "y"
      nameys = name_data[1]
    end
  end
  puts nameys
end

puts "NAMES OF PEOPLE"
name_lister_file(File.new("potter.csv", "r"))
puts "\nARRAYS OF PEOPLE MENTIONED A LOT"
mentioned_alot(File.new("potter.csv", "r"))
puts "\nHOUSES OF HOGWARTS"
houses(File.new("potter.csv", "r"))
puts "\nWIZARDS WITH ONE WORD NAMES"
one_word_names(File.new("potter.csv", "r"))
puts "\nNUMBER OF HUFFLEPUFF WIZARDS IN THE LIST"
huff_n_puff(File.new("potter.csv", "r"))
puts "\nSLYTHERINS ARE REVERSED!!!!"
nirehtyls(File.new("potter.csv", "r"))
puts "\nGRYFFINDOR FAMILY NAMES"
gryff_families(File.new("potter.csv", "r"))
puts "\nBADGERING THE FAMILY"
badger_weasley(File.new("potter.csv", "r"))
puts "\nNAMES ENDING WITH Y"
namey(File.new("potter.csv", "r"))
