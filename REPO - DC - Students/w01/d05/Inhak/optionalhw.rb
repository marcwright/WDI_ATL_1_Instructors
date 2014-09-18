class Shirt
  def initialize(size, color, text)
    @size = size
    @color = color
    @text = text
  end
end

pearl_jam_t = Shirt.new("XL", "faded black", "Yield Tour 1998")
hipster_plaid = Shirt.new("M", "red", "NO LOGO")
david_beckham_jersey = Shirt.new("L", "white", "Beckham")

class Car
  def initialize(year, brand, model, color)
    @year = year
    @brand = brand
    @model = model
    @color = color
  end

  def start_engine
    return "Vrum vrum vrum!"
  end

end

dads_miata = Car.new(1992, "Mazda", "Miata", "red")
dads_miata.start_engine()
all_electric_dreamcar = (2014, "Tesla", "Model-S", "black")
travs_first_car = (1995, "Oldsmobile", "Cutlass Cierra SL", "maroon")

class Concert
  def initialize(band, city, venue, date)
    @band = band
    @city = city
    @venue = venue
    @date = date
  end
end

best_night_of_life = Concert.new("Built to Spill", "Chicago", "Metro", "May 8th, 2005")
embarassing_first_concert = Concert.new("Sugar Ray", "Milwaukee", "Marcus Ampitheater", "like 1998")
