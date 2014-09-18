class Student

	def initialize(name, age)
		@name = name
		@age = age
	end

	def name 
		return @name
	end
	
	def name=(name)
		@name = name
	end

	def age 
		return @age
	end

	def say_hello
		if @age < 18
			return 'sup'
		else
			return "Hello #{@name}"
		end

	def do_homework
		return "I'm doing my homework and loving it"
	end

	end

s1 = Student.new('Bob', 20)
s2 = Student.new('Ralph' 15)

puts s1.say_hello()
puts s2.say_hello()

s1.name = 'Paul'

puts s1.name