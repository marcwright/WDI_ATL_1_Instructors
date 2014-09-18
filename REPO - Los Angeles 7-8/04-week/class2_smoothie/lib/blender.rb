class	Blender
	attr_accessor :lid, :switch

	def initialize(lid, switch)
		@lid = lid
		@switch = switch
	end

	def blend(ingredients)
		return ingredients
	end
	def ready_to_blend
		@lid == false ? true : false
		@switch == false ? true : false
	end

end