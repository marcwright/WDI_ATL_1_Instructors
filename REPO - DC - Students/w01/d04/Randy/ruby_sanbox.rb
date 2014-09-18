class Student
	def do_homework
		puts "I'm doing my homework and loving it!"
	end
	
	def initialize(name, age)
		@name = name
		@age = age
	end

	def name
		return @name			#This is a getter
	end								#Allows data out of the class instance, but will not let data in.

	def name=(name)
		@name = name			#This is a setter
	end								#Will allow users to set a new value to the instance variable

	def age
		return @age
	end

	def say_hello
		if @age < 18
			return "Sup?"
		else
			return "Hello my name is #{@name}"
		end
	end

	def to_s
		return "Student."
	end

## All these defs are essentially the the methods available 
## to the class 'Student'
##LIke the 'String' class has things like .length, .reverse, etc ...

end

s1 = Student.new("Bob", 45)


puts s1.say_hello

s2 = Student.new("Sara", 12)
puts s2.say_hello
# puts s2.do_homework()
# puts s2