# class ParkingMeter
# 	def initialize
# 		@coin = coin
# 		@timer = 0 

# 	end
# #Allows time to be added
# 	def add_time
		
# 	end
# 	#accept a coin
# 	def add_time=(coin)
# 		#examine coin
# 		#determine value
# 		#add time based on denomination
# 	end
# 	#removes time
# 	def remove_time
		
# 	end
# #Specifies if the parking meter is currently expired
# 	def expired?
		
# 	end
# #Number that specifies the number of minutes remaining.
# 	def time_remaining
		
# 	end
# end



class Cartridge(variety)
	def initialize
		@variety = variety
		@is_new = true
	end

	def is_new?

	end

	def variety

	end

	def puncture

	end
end
#---------------------------------
#---------------------------------

class CoffeeMaker
	def initialize
		@water_level = 0
		@cartridge = nil
		@ready = true
	end 
	#Determines what size will be make and brews (s/m/l).
	def brew(size)
		@size = size
		#Requirements:
		#-Needs to check if there is water.
		#-Check to see if there is a cartridge.
		#Outcome
		#- Heat water
		# - puncture cartridge and run water through.
		#-Assess size and select teh amount of water.
	end
	#Adds a specific amount of water into machine
	def add_water(amount)
	end
	#Indicates the current amount of water in the machine.
	#As a percentage.
	def water_level
	end
	#Recieves an instance of the cartridge class.
	def get_cartridge(cartridge)
		@cartridge = cartridge
	end
	# Selects the temp of the brewing
	def select_temp(range_of_temp)
	end
	#Checks to see if water is empty
	def water_empty?
	end
	#Ejects used cartridge
	def eject_cartridge
	end
	def has_cartridge?
	end
end






















