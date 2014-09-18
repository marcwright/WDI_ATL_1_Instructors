
class Student


    def initialize(name, age) #this method defines arguments allowed for this CLASS. we need 
                              # getters to share this data 'outside' this initialize method.
    	@name = name
    	@age = age
    end


    def name #this method allows the class to use the name method--its called a 'GETTER'
    	return @name
    end


    def name=(name) #this method allows the class value to be CHANGED. --its called a 'SETTER'
    	@name = name
    end


    def age #this method allows the class to use the age method--its called a 'GETTER'
    	return @age
    end
    

#age doesnt have a setter -- who can change their AGE!?

    def to_s # to_s is a default method for a class. it returns a string when you call the class later.
    	return "I'm a student."
    end
    
    def do_homework
    	return "I'm doing my homework!"
    end


end

s1 = Student.new("Gabe", 30)

puts s1.name

s1.name = "Gabbers"
 
puts s1.name