require "pry"

data_base = []

    f = File.new("potter.csv", "r")
    f.each_line do |line|
      characters_array = line.chomp.split(",")
      character_hashes = {:mentions => characters_array[0], :name => characters_array[1], :house => characters_array[2]}
      data_base << character_hashes

  end

###
#all_famous_names
###
famous_names = data_base.select do |array|
 	 	array[:mentions].to_i > 500
 #why does this print the entire line and not simple values?
 #why does "putting" famous names in the block break it?
 end


###
#all_the_houses
###
houses = data_base.map do |item|
	item[:house]
end

houses = houses.delete_if do |value|
	value == nil
end

#puts houses.uniq

###
#one_word_names
###
names = data_base.each do |character_name|
	character_name[:name]
end

one_word_names = names.delete_if do |each_name|
    each_name(" ")
end

puts one_word_names

f.end
