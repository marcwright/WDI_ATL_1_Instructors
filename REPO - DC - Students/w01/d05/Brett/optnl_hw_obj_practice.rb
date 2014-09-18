require 'pry'

#upon instantiation (meaning the creation of a new object of the Shirt class), the class's initialize method should take 3 arguments:
# size, color, text
class Shirt

  def initialize(size, color, text)
    @size = size
    @color = color
    @text = text
  end

  def create_shirt
   @shirt = [@size, @color, @text]
  end
end

# upon instantiation, the Car class's initialize method should take 4 arguments and set them to instance variables.
# year, brand, model, color
class Car

  def initialize(year, brand, model, color)
    @year = year
    @brand = brand
    @model = model
    @color = color
  end

# write an instance method called start_engine that returns the string "Vrum vrum vrum!"
  def start_engine
    return "Vrum vrum vrum!"
  end
end

# upon instantiation, the Concert class's initialize method should take 4 arguments: band, city, venue, date
class Concert

  def initialize(band, city, venue, date)
    @band = band
    @city = city
    @venue = venue
    @date = date
  end

end


# SHIRTS
# instantiate a new shirt, pearl_jam_t, which is extra-large, a nicely faded black, and says "Yield Tour 1998"
pearl_jam_t = Shirt.new("XL", "black", "Yield Tour 1998")
pearl_jam_t =  pearl_jam_t.create_shirt

# instantiate another new shirt, hipster_plaid which is size medium, the color red, says "NO LOGO" on the back
hipster_plaid = Shirt.new("M", "red","NO LOGO")
hipster_plaid = hipster_plaid.create_shirt

# instantiate another new shirt, david_beckham_jersey which is large, white, and has the text "Beckham"
david_beckham_jersey = Shirt.new("L", "white", "Beckham")
david_beckham_jersey = david_beckham_jersey.create_shirt

#CARS
#instantiate a new car, dads_miata, which is a red Miata and was produced by Mazda in 1992.
dads_miata = Car.new(1992,"Mazda", "Miata", "red" )
puts dads_miata.start_engine

# instantiate another new car, all_electric_dreamcar, which is a black Model-S and was produced by Tesla Motors earlier this year.
all_electric_dreamcar = Car.new(2014, "Tesla", "Model-S", "black")

#instantiate one more car, travs_first_car, which was a maroon 1995 Oldsmobile Cutlass Cierra SL.
travs_first_car = Car.new(1995, "Oldsmobile", "Cutlass Cierra SL", "maroon")

#CONCERTS
# instantiate a new concert, best_night_of_life, that represents Built to Spill's performance at the Metro in Chicago on May 8th, 2005.
best_night_of_life = Concert.new("Built to Spill", "Chicago", "Metro", "May 8th, 2005")

#instantiate a new concert, embarrassing_first_concert, which took place in Milwaukee, Wisconsin in like 1998 at the Marcus Amphitheater. The band? Sugar Ray.
embarrassing_first_concert = Concert.new("Sugar Ray", "Milwaukee", "Marcus Amphitheater", "1998")
