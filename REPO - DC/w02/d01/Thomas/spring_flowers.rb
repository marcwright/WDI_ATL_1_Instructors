class Flower
	def initialize
		@type = type
		@color = color
		@how_to_pick = "Break the stem"
	end
  
  public 

    def type
    	return @type
    end

    def color
    	return @color
    end

    def how_to_pick
    	puts @how_to_pick
    end

end


class Tulip < Flower
	def initialize
		super
		@type = "perennial"
		@color = "purple"
	end
end


class Zinnia < Flower
	def initialize
		super
		@type = "annual"
		@color = "blue"
	end
end


class Rose < Flower
	def initialize
		super
		@type = "perennial"
		@color = "red"
		@how_to_pick += ", wear gloves!"
	end
end