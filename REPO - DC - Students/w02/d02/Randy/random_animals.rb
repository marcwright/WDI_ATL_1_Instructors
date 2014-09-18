random_animals = ["porpoise", "camel", "lobster", "kangaroo", "wombat", "chameleon"]

# random_animals.each{|animal|
# puts "#{animal}s, "}

# sorted_animals = random_animals.sort
# puts sorted_animals

# sorted_animals = random_animals.sort
# puts sorted_animals.reverse

# backwards = random_animals.map {|animal|
# 	animal.reverse}

# 	puts backwards

# word_length = random_animals.sort_by{|animal| animal.length}
# 	puts word_length


sorted_alpha_last = random_animals.sort_by{|animal| animal[-1]}
	puts sorted_alpha_last