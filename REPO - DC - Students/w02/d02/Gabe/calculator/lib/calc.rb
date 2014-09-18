class Calculator

	def add(a, b)
		return a + b
	end

	def subtract(a, b)
		return a - b
	end

	def power(a, b)
		return a ** b
	end

	def sum(array)
		array.reduce(0) do |sum, value|
  		sum + value
  		end
	end

	def multiply(*args)
		args.reduce(1) do |product, value|
  		product * value
  		end
	end

	def factorial(a)
  		return 1 if a == 0
  		else 1.upto(a).inject(:*)
  		
	end







end