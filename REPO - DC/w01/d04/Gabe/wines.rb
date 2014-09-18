wine_cellar = [
  {:label => "Rutherford Hill", :type => "Chardonnay", :color => "white"},
  {:label => "Nina Veneto", :type => "Pinot Grigio", :color => "white"},
  {:label => "Wairau River", :type => "Sauvignon Blanc", :color => "white"},
  {:label => "Tangley Oaks", :type => "Merlot", :color => "red"},
  {:label => "Chimney Rock", :type => "Cabernet Sauvignon", :color => "red"},
  {:label => "Sanford", :type => "Pinot Noir", :color => "red"},
  {:label => "Alderbrook", :type => "Pinot Noir", :color => "red"},
  {:label => "Colavita", :type => "Pinot Noir", :color => "red"},
  {:label => "Markham", :type => "Chardonnay", :color => "white"},
  {:label => "Angeline", :type => "Pinot Noir", :color => "red"}
]

#add a wine
puts "wine name:"
wine_name = gets.chomp.capitalize
puts "wine type:"
wine_type = gets.chomp.capitalize
puts "wine color:"
wine_color = gets.chomp.downcase

wine_cellar.push({:label => wine_name, :type => wine_type, :color => wine_color})

puts wine_cellar


#returns random wine:
random_wine = wine_cellar.sample
puts random_wine


#returns only white wines.
whites = wine_cellar.select {|wine| wine[:color].include? ("white")}
puts whites

#this one also returns only white wines, using ==.
whites = wine_cellar.select {|wine| wine[:color] == ("white")}
puts whites


puts "test"
#list the different wine types
our_types = wine_cellar.map {|wine| wine[:type]} #using map here makes a new array called our types 
puts our_types.uniq #then we use uniq to show only unique entries.


#list ONLY the 2-word wine labels
puts "test"
puts two_word_labels =  wine_cellar.select {|wine| wine[:label].include? (" ")}

puts two_word_labels



#Returns an array with the labels of the wines that are a type of Pinot Noir
puts "test last"
pino_noirs = wine_cellar.select {|wine| wine.has_value? ("Pinot Noir")}
pino_noir_labels = pino_noirs.map {|wine| wine[:label]}

puts pino_noir_labels

