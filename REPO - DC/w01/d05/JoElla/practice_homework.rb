require "pry"
class Shirt
  def initialize(size, color, text)
    @size = size
    @color = color
    @text = text
  end

end

shirt_one = Shirt.new("large", "black", "Pearl Jam")



class Car
  def initialize(year, brand, model, color)
    @year = year
    @brand = brand
    @model = model
    @color = color
  end

  def start_engine
    puts "vrum vrum"
  end

end

dads_miata = Car.new("1992", "Mazda", "Miata", "red")

dads_miata.start_engine

all_electric_dream_car = Car.new("2014", "Tesla", "Model S", "black")

puts all_electric_dream_car

puts all_electric_dream_car.start_engine


class Concert
  def initialize(band, city, venue, date)
    @band = band
    @city = city
    @venue = venue
    @date = date
  end

end

best_night = Concert.new("Built to Spill", "Chicago", "Metro", "5/20/2005")



binding.pry

