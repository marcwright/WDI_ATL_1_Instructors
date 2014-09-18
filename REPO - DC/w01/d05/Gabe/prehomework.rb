class Shirt

	def initialize(size, color, text, front_or_back)
		@size = size
		@color = color
		@text = text

	end

end



class Car

	def initialize(year, brand, model, color)
		@year = year
		@brand = brand
		@model = model
		@color = color
	end

	def start_engine
		puts "The #{@brand} #{@model} goes Vrum vrum vrum!"
	end
end

class Concert

	def initialize(band, city, venue, date)
		@band = band
		@city = city
		@venue = venue
		@date = date
	end

	def band #these allows us to access the @band argument with a class method.
		band =  @band
	end

	def city 

		city =  @city
	end

	def venue 
		return  @venue #you can also say "return" instead of "blah = @blah"
	end

	def date 
		date =  @date
	end
end




#SHIRTS
pearl_jam_t = Shirt.new("extra-large", "nicely faded black", "Yield Tour 1998", "front")

hipster_plaid = Shirt.new("medium", "red", "NO LOGO", "back")

david_beckham_jersery = Shirt.new("large", "white", "Beckham", "back")


#CARS
dads_miata = Car.new(1992, "Mazda", "Miata", "red")

dads_miata.start_engine

all_electric_dream_car = Car.new(2014, "Tesla", "Model-S", "black")

all_electric_dream_car.start_engine

travs_first_car = Car.new(1995, "Oldsmobile", "Cutlass Sierra SL", "maroon")

#CONCERTS

best_night_of_life = Concert.new("Built to spill", "Chicago, IL", "The Metro", "May 8th 2005")

embarassing_first_concert = Concert.new("Sugar Ray", "Milwaukee, WI", "Marcus Ampitheatre", "1998")

puts embarassing_first_concert.band


#trying to put out all the concert info...

first_band = embarassing_first_concert.band
first_city = embarassing_first_concert.city
first_venue = embarassing_first_concert.venue
first_date = embarassing_first_concert.date

puts "Travis loved his first concert, seeing #{first_band} at #{first_venue} in #{first_city} on #{first_date}. "


dads_miata_noself = dads_miata
dads_miata_self = self.dads_miata

puts dads_miata_self
puts dads_miata_noself