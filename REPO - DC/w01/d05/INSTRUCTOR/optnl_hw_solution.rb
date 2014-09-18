require 'pry'

# sets up Shirt class definition (in essence, a blueprint for Shirt objects)
class Shirt
  # takes 3 arguments on instantiation, all of which are set to instance variables
  def initialize(size, color, text)
    @size  = size
    @color = color
    @text  = text
  end

end

# creating 3 instances of the shirt class
pearl_jam_t = Shirt.new("XL", "faded black", "Yield Tour 1998")
hipster_plaid = Shirt.new("M", "Red", "NO LOGO")
david_beckham_jersey = Shirt.new("L", "White", "Beckham")

class Car
  def initialize(year, brand, model, color)
    @year  = year
    @brand = brand
    @model = model
    @color = color
  end

  def start_engine
    return "Vrum vrum vrum!"
  end
end

dads_miata = Car.new(1992, "Mazda", "Miata", "Maroon")
puts dads_miata.start_engine
all_electric_dreamcar = Car.new(2014, "Tesla", "Model-S", "Black")
travs_first_car = Car.new(1995, "Oldsmobile", "Cutlass Cierra SL", "Maroon")


class Concert
  def initialize(band, city, venue, date)
    @band = band
    @city = city
    @venue = venue
    @date = date
  end

end


best_night_of_life = Concert.new("Built to Spill", "Chicago", "The Metro", "05/08/2005")
embarrassing_first_concert = Concert.new("Sugar Ray", "Milwaukee", "The Marcus Amphitheater", "1998")

binding.pry
