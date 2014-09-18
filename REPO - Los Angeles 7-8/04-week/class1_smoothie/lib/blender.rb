class Blender
	
	def initialize
		@status = false
	end

	def juice(flavor)
		return flavor
	end

	# @ingredients = []

	def blend(ingredients)
		if switch == true
			ingredients.join.delete(' ').split('').shuffle.join
		else 
			puts "no kid fingers"
		end
	end

	def switch
		@status =(@status == true) ? false : true 
	end

end