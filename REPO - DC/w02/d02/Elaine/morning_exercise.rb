random_animals = ["porpoise", "camel", "lobster", "kangaroo", "wombat", "chameleon"]

# plural each animal
puts "Plural:"
random_animals.each do |animal|
  puts animal + "s"
end

# array of animals sorted alphabetically

puts ""
puts "Alphabetically:"
alphabetical_animals = random_animals.sort

puts alphabetical_animals

puts ""

puts "Reverse Alphabetically:"
puts ""

reverse_animals = random_animals.sort.reverse

puts reverse_animals

# reverse each string
puts ""
reversed_string = random_animals.map do |animal|
  animal.reverse
end

puts "Each animal reversed"
puts reversed_string

# Sorted by length

puts ""
puts "Sorted by length"
length_sorted = random_animals.sort_by { |animal| animal.length }
puts length_sorted


# Sorted by last letter

puts ""
puts "Sorted by last letter"
length_sorted = random_animals.sort_by { |animal| animal[-1] }
puts length_sorted
