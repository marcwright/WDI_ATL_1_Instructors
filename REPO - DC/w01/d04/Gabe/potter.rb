								#potty = File.new("potter.csv", "r") 
								#potty.to_a.map.each {|row| row.to_hash }
								
								#puts potty
potty = {}
f = File.new("potter.csv", "r") #read only File
f.each_line do |line| 
characters = line.chomp.split(",")

mentions = characters[0]
persons = characters[1]
houses = characters[2]

numerical_mentions = mentions.to_i #HERE I finally successfully converts the instance numbers to fixnums!

							#puts persons
						
							#potter_characters_hash = Hash[characters.map {|num, person, house| [num]=>num: [person]=>person: [house]=>house: }]
							#puts "potter_characters_hash: #{potter_characters_hash.inspect}"
							
							#potter_characters_hash = Hash[characters.map {|value, key| [key, value]}]
							#puts "potter_characters_hash: #{potter_characters_hash.inspect}"
							#puts potter_characters_hash

bub = Hash[numbers: mentions, dudes: persons, houses: houses]  
puts bub[:dudes] #HERE I PRINT OUT ONLY THE NAMES OF HP DUDES. 1 of 9

puts "-- AND HIS HOUSE IS ... --"

bub = Hash[numbers: mentions, dudes: persons, houses: houses]  
all_da_houses = bub[:houses]
puts all_da_houses #PUTS NAMES OF HOUSES (but needs to remove dupliucates / uniq???) 3 of 9

puts "---------------"

puts numerical_mentions

puts "$" #TTEMPT TO PRINT MENTIONS OVER 500 BELOW: BROKEN

#unique = numerical_mentions do |mention_count| mention_count > 500 
#	puts unique
#	end
#puts unique
#
#puts" end$ "




end
f.close	




#popular = Hash[numbers: mentions, dudes: persons, houses: houses].select {|guys| guys[:numbers] > 500}
#puts whites












								#names_only = characters.each {|num, name, house| puts name}
								#puts names_only


