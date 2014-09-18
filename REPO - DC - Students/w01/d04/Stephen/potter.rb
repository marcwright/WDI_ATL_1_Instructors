# Stephen Stanwood (stephen@stanwoodsolutions.com)

# Returns an array containing the names of all characters
def names(chars)
  return chars.map { |c| c[:name] }
end

# Returns an array containing the characters with 500+ mentions
def more_500(chars)
  return chars.select { |c| c[:mentions] >= 500 }
end

# Returns an array with the names of all houses
def house_names(chars)
  return (chars.map { |c| c[:house] }).uniq
end

# Returns an array of all characters with one-word names
def one_word_names(chars)
  return (chars.select { |c| c[:name].split.size == 1 })
end

# Returns an array of all characters from Hufflepuff
def huff_chars(chars)
  return (chars.select { |c| c[:house] == "Hufflepuff" })
end

# Returns an array of all characters with Slytherin characters' names reversed
def rev_slytherin(chars)
  sly = chars.select { |c| c[:house] == "Slytherin" }
  return sly.map { |c| c[:name].reverse }
end

# Returns an array of unique last names of Gryffindor folks
def gryff_last_names(chars)
  gryff = chars.select { |c| c[:house] == "Gryffindor" }
  names = gryff.map { |c| c[:name] }
  return (names.map { |n| n.split(" ").last }).uniq
end

# Returns an array with all of the Weasleys, with added last name of "Badger"
def weasley_badger(chars)
  weasleys = chars.select { |c| c[:name].split.last == "Weasley" }
  return weasleys.map { |w| w[:name].split.insert(1, "Badger").join(" ") }
end

# Returns an array with the first names of all
# characters whose first names end in 'y'
def fn_ending_in_y(chars)
  full_names = names(chars).select { |n| n.split.first[-1] == 'y' }
  return full_names.map { |fn| fn.split.first }
end

# Returns an array of names that contain "ll"
def names_with_ll(chars)
  return names(chars).select { |n| n.include? "ll" }
end

# Returns an array of names that contain multiple "k"s
def multiple_ks(chars)
  return names(chars).select { |n| n.count('k') >= 2 }
end

# Returns an array of alliterative names, sorted alphabetically
def alliterative_names(chars)
  allit_names = names(chars).select do
    |n|
    ns = n.split
    (ns.first[0] == ns.last[0]) && (ns.size > 1)
  end
  return allit_names.sort_by { |n| n.downcase }
end

# Empty array for information about chars
chars = []

# Read all of the Harry Potter data into an array of hashes
f = File.new("potter.csv", "r")
f.each_line do |line|
  data = line.chomp.split(',')
  if data.size == 3
    chars.push({ :mentions => data[0].to_i, :name=> data[1], :house=> data[2].chomp })
  else
    chars.push({ :mentions => data[0].to_i, :name=> data[1] })
  end
end

puts "All Names:\n\n#{names(chars).join(", ")}\n\n\n"

puts "500+ Mentions:\n\n"
puts more_500(chars)
puts "\n\n"

print "All Houses:\n\n"
puts (house_names(chars).select { |c| c != nil }).join(", ")
puts "\n\n"

puts "One-Word Names:\n\n"
puts one_word_names(chars)
puts "\n\n"

puts "Hufflepuff Characters:\n\n"
puts huff_chars(chars)
puts "\n\n"

puts "Slytherin Reversed:\n\n"
puts rev_slytherin(chars)
puts "\n\n"

puts "Gryffindor Last Names:\n\n"
puts gryff_last_names(chars)
puts "\n\n"

puts "Badger Weasleys:\n\n"
puts weasley_badger(chars)
puts "\n\n"

puts "First Names Ending in 'Y':\n\n"
puts fn_ending_in_y(chars)
puts "\n\n"

puts "Names Containing 'll':\n\n"
puts names_with_ll(chars)
puts "\n\n"

puts "Names Containing Multiple 'k's:\n\n"
puts multiple_ks(chars)
puts "\n\n"

puts "Alliterative Names:\n\n"
puts alliterative_names(chars)
puts "\n\n"
