require 'pry'

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

puts ""
puts "Enter the name of the wine you would like to add."
entry_name = gets.chomp

puts ""
puts "Enter the type of wine (i.e. Chardonnay, Pinot Grigio, Sauvignon Blanc, Merlot, etc."
entry_type = gets.chomp

puts ""
puts "Select the color of the wine. (red or white)"
entry_color = gets.chomp.downcase


wine_cellar.push({:label => entry_name, :type => entry_type, :color => entry_color})



random_wine = wine_cellar.sample
puts random_wine

# white_wines = []

# number = 0
# while number < wine_cellar.length
#   if wine_cellar[number][:color] == "white"
#     white_wines.push(wine_cellar[number])
#   end
#   number += 1
# end

white_wines = wine_cellar.select do |wine|
  wine[:color] == (“white”)
end

unique_wines = []






binding.pry
