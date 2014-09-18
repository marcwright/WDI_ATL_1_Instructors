require "pry"
#Need to create two classes
	#Person class
	#Apartment class
#Person class needs three attributes (name, age, gender)

list_of_people = []
list_of_apartments = []

class Person
	attr_accessor :name
	attr_accessor :age
	attr_accessor :gender

  def initialize(name, age, gender)
  	@name = name
  	@age = age
  	@gender = gender
  end
end

#Apartment class needs several variables:
	#Address (This will include floor & unit number as a single string
	#monthly_rent
	#sqft
	#num_beds
	#num_baths
	#renters (the instance of the person class that lives in the apartment)
class Apartment
	
	attr_accessor :address
	attr_accessor :monthly_rent
	attr_accessor :sqft
	attr_accessor :num_beds
	attr_accessor :num_baths
	attr_accessor :renters

	def initialize (address, monthly_rent, sqft, num_beds, num_baths, *renters)
		@address = address
		@monthly_rent = monthly_rent
		@sqft = sqft
		@num_beds = num_beds 
		@num_baths = num_baths
		@renters = renters
	end

end
# If the apartment is unoccupied(no renters) you should say something like: Apt 1A is 750 sqft and has 1 bed and 1 bath. It costs $2500 a month
# If the apartment is occupied by a tenant, you should say something like: Travis lives in Apt 1A

def display_of_all_apartments_method(array)
	 array.each do |instance|
	 	#binding.pry
	 	if instance.renters[0].class == Person && instance.renters != "Unoccupied"
	 		if instance.renters.length == 1
	 			instance.renters.each do |tenant|
		 		puts "#{tenant.name} lives in apartment #{instance.address}."
		 			end
		 	else 
		 		instance.renters.each do |person| 
		 			puts "#{person.name} lives in apartment #{instance.address}"
		 		end
		 	end
		elsif instance.renters[0] == "Unoccupied"
		 		puts "#{instance.address} is #{instance.sqft} square feet, with #{instance.num_beds} bedrooms & #{instance.num_baths} bathrooms. Rent is $#{instance.monthly_rent} a month"		
	    end
	    #end
	end

end
#Need to add the ability to select which apartment. (value.address) and display infor accordingly
def apartment_details(array)
  puts "What apartment would you like to see more about?"
	array.each{|instance|
    		   puts "#{instance.address} -- "}
         	  which_apt = gets.chomp.to_s
 	array.each{|instance|
 		if instance.address == which_apt && instance.renters == "Unoccupied"
 			puts "\nApartment #{instance.address}: Monthly Rent: #{instance.monthly_rent} Square Feet: #{instance.sqft}\nBedrooms: #{instance.num_beds} Bathrooms: #{instance.num_baths} Tenants: Unoccupied\n"	
 		elsif 
 		  instance.address == which_apt && instance.renters[0].class == Person && instance.renters != "Unoccupied"
 		  	instance.renters.each do |tenant|
 		  		puts "\nApartment #{instance.address}: Monthly Rent: #{instance.monthly_rent} Square Feet: #{instance.sqft}\nBedrooms: #{instance.num_beds} Bathrooms: #{instance.num_baths} Tenants: #{tenant.name}\n"
		 	end
 		    	
 		end}
end
#Add an apartment
def create_an_apartment(address, monthly_rent, sqft, num_beds, num_baths, renters)
	if  renters.class == Person && renters != "Unoccupied"
		Apartment.new(address, monthly_rent, sqft, num_beds, num_baths, *renters)
	elsif renters == "Unoccupied" 
		Apartment.new(address, monthly_rent, sqft, num_beds, num_baths, *renters)
	elsif renters.class != Array && renters != "Unoccupied" && renters.class == String
		name = renters
		puts "What is the renters age?"
			age = gets.chomp
		puts "What is the renters gender?"
			gender = gets.chomp
			renters = Person.new(name, age, gender)
		Apartment.new(address, monthly_rent, sqft, num_beds, num_baths, *renters)
	end
	
end

def add_a_new_tenant(array)
	puts "To which apartment would you like to add a tenant?"
	array.each do |instance|
    		  puts "#{instance.address} -- "
    		end
         	  which_apt = gets.chomp.to_s
 	array.each do |instance|
 		if instance.address == which_apt
 			 puts "What is the tenants name?"
         	 name = gets.chomp
         	 puts "What is the tenants age?"
         	 age = gets.chomp
         	 puts "What is the tenants gender?"
         	 gender = gets.chomp
         	 new_tenant = Person.new(name, age, gender)
         	 instance.renters.push(new_tenant)
        end
        end
end

#I will need to create several new instances of the apartment class 
#I will need to present the user with a menu of options:
	#Lists all apartments
	#View an apartment's details
	#Add an apartment
	#Add a tenant to an apartment
	#Quit
#The program should return the user to the menu after each selection, until the user quits
sally = Person.new("Sally", 36, "Female")
john = Person.new("John", 24, "Male")
rich = Person.new("Rich", 33, "Male")
oliver = Person.new("Oliver", 50, "Male")

list_of_apartments.push(create_an_apartment("101A", "400", "75", "2", "1", sally))
list_of_apartments.push(create_an_apartment("106C", "123", "12", "1", "0", john))
list_of_apartments.push(create_an_apartment("200B", "17000", "8000", "6", "14", rich))
list_of_apartments.push(create_an_apartment("300B", "8000", "900", "6", "4", oliver))
list_of_apartments.push(create_an_apartment("Penthouse", "45000", "9000", "8", "9", "Unoccupied"))


menu_choice = ""

while menu_choice != "5"
puts "\nWelcome to (GA)partements!"
puts "Please select an option from our menu:"
puts "1 - List of All apartments"
puts "2 - View Details of a Specific Apartment"
puts "3 - Add an Apartment to our listings"
puts "4 - Add a Tenant to an Apartment"
puts "5 - Quit"
menu_choice = gets.chomp

  case menu_choice
#The "List of all apartments" menu option should:
	#List all apartments
	#IF the apartment is unoccupied:
		#print to the user:
			#"Apt #X is XXXsqft and has X bedrooms and X bathrooms"
			#"It costs $2500 per month"
	#IF the apartment is occupied:
		#print to the user:
			#PERSON lives in Apt #X
    when "1"
    	display_of_all_apartments_method(list_of_apartments)
#The "View an apartment" option should display to the user:
	#address, monthly_rent, sqft, num_beds, num_baths, & renters
    when "2"
    	apartment_details(list_of_apartments)
#The "add an apartment" option should promt the user for all the needed input
    when "3"	
	puts "What is the apartment address (ex. 7B)?"
	address = gets.chomp
	puts "What is the Monthly Rent?"
	monthly_rent = gets.chomp.to_i
	puts "How many Square Feet is the Apartment?"
	sqft = gets.chomp.to_i
	puts "How many Bedrooms does the Apartment have?"
	num_beds = gets.chomp.to_i
	puts "How many Bathrooms does the Apartment have?"
	num_baths = gets.chomp.to_i
	puts "Who lives in the Apartment?"
	renters = gets.chomp

	list_of_apartments.push(create_an_apartment(address, monthly_rent, sqft, num_beds, num_baths, renters))
	binding.pry

#The "Add a tenant" option should:
	#Check that the input from the user is of the correct type (input.class == the correct class)
	#Ask what apartment they want to live in
	#Add the person to the apartment
		#At first ONLY 2 people may occupy one apartment	
	when "4"
		add_a_new_tenant(list_of_apartments)
	else 
		puts "Please select an appropriate option"
    end
end












