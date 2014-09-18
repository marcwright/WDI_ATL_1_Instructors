class FortuneCookie

	def initialize
		@wrapped = true
	end

	def wrapped?
	  return @wrapped
	end

	def unwrap!
		@wrapped = false
	end
 

	def cracked?
		return @cracked
	end

	def crack!
		if @wrapped == false
		then
		@cracked = true
		end
	end


	def read
		if @wrapped
			return "unwrap me!"
		elsif !cracked? ""
			elsif @cracked == true
		then "fortune!"
			else "you must unwrap and crack cookies to read them!"
		end
	end

end