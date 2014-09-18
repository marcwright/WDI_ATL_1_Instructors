require "pry"
ppl = []
f = File.new("potter.csv", "r")
  f.each_line do |line|
    ppl_array = line.chomp.split(",")
    ppl.push({:mentions => ppl_array[0].to_i, :name => ppl_array[1], :house => ppl_array[2]})
  end
f.close

#just names
names = ppl.map do |person|
  person[:name]
end
#ppl w over 500 mentions
lotsa_mentions = ppl.select { |person| person[:mentions] > 500 }
#just unique houses
houses = ppl.map do |person|
  person[:house]
end
unique_houses = houses.uniq
#ppl w just one name
one_name = ppl.select do |person|
  !person[:name].include?(" ")
end
#ppl in hufflepuff
hufflepuff = ppl.select do |person|
  person[:house] == "Hufflepuff"
end

#-----Slytherin incomplete
#all ppl, with Slytherin ppl reversed


def reverse_slytherin(arry)
  ppl.each
  if arry[:house] == "Slytherin"
    sly_back = array[:name].reverse
  end
end

reverse_slytherin(ppl)

slytherin = ppl.select do |person|
 person[:house] == "Slytherin"
end

#-----Gryffindor, incomplete
#Gryffindor ppl unique last names
#put :name into array, from that even numbered indices into another array and call .uniq
gryffindor = ppl.select do |person|
  person[:house] == "Gryffindor"
end

gryff_names = gryffindor.map do |person|
  person[:name]
end

gryff_split = gryff_names.map do |person|
  person.split(" ")
end

one_gryff = gryff_split.flatten

gryff_last_name = one_gryff.each_index.select { |i|
i.even? }



#all Weasleys, interpolate middle name Badger

#first names of ppl w first name ending in Y

binding.pry


#ppl.push({:name => name, :mentions => mentions, :house => house})


