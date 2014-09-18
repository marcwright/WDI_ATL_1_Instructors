require "pry"
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

def get_input(text)
  text.chomp
end

puts "What do you want to add?"
your_wine_name = get_input(gets)

puts "What type of wine is it?"
your_wine_type = get_input(gets)

puts "What color is it?"
your_wine_color = get_input(gets)

wine_cellar.push({:label => your_wine_name, :type => your_wine_type, :color => your_wine_color})

random = wine_cellar.sample

whites = wine_cellar.select { |wine| wine[:color] == "white"}

types = []

# wine_cellar.select do |wine|
#   wine[:color] == "white"
#   types.push(xxxxx.values)
# end

uniques = wine_cellar.map do |wine|
  wine[:type]
end
uniques.uniq

two_word_labels = wine_cellar.select do |wine|
  wine[:label].include?(" ")
end

binding.pry



