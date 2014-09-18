
class Student


    def initialize(name, age) #this method defines arguments allowed for this CLASS. we need 
                              # getters to share this data 'outside' this initialize method.
    	@name = name
    	@age = age
    end


    def name #this method allows us to GET the name variable out of the class instance--its called a 'GETTER'
    	return @name
    end


    def name=(name) #this method allows the class variable value to be CHANGED. --its called a 'SETTER'
    	@name = name
    end


    def age #this method allows the class to use the age variable passed in to the class--its called a 'GETTER'
    	return @age
    end
    

#age doesnt have a setter -- who can change their AGE!?

    def to_s # to_s is a default method for a class. it returns a string when you call the class later.
    	return "I'm a student."
    end
    
    def do_homework
    	return "I'm doing my homework!"
    end

    def say_hello
    	if @age < 18
    		return "Sup?"
    	else
    		return "Good afternoon. My name is #{@name}"
    	end
    end



end

s1 = Student.new("Gabe", 30)

puts s1.name

s1.name = "Gabbers"
 
puts s1.name


puts "2 other people:"

s2 = Student.new("Bobby", 16)
s3 = Student.new("Robert", 33)

puts s2.say_hello
puts s3.say_hello

s3.name = "Frederick"

puts s3.say_hello
