require 'pry'

#1) SETTING UP EMPTY ARRAYS
people = []
apartments = []

#2) ESTABLISHING CLASSES
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

class Apartment
  attr_accessor :address
  attr_accessor :monthly_rent
  attr_accessor :sqft
  attr_accessor :num_beds
  attr_accessor :num_baths
  attr_accessor :renters
  def initialize(address, monthly_rent, sqft, num_beds, num_baths, renters)
    @address = address
    @monthly_rent = monthly_rent
    @sqft = sqft
    @num_beds = num_beds
    @num_baths = num_baths
    @renters = renters
  end
end

#3) DEFINING METHODS

#This prints the options on separate lines; more aesthetically pleasing than array form.
def list_menu_options(array)
  array.each do |x|
    puts x
  end
end

#Method for handling inoccupancy
def is_it_occupied(x)
  if x.renters == nil
    return "vacant"
  else
    return "occupied"
  end
end

#Method for Option 1
def list_apartments(array)
  puts "Here are the apartments:"
  array.each do |x|
    puts x.address.to_s
  end
end

#Method for Option 2
def view_apt_details(array)
  list_apartments(array)
  puts "Which apartment would you like to know more about?"
  apartment = gets.chomp.to_s
  array.each do |x|
    occupancy = is_it_occupied(x)
    if x.address == apartment
      puts "Apartment #{x.address} has #{x.num_beds} bedroom(s) and #{x.num_baths} bathroom(s).  It is #{x.sqft} square feet and rents for $#{x.monthly_rent}/month.  It is currently #{occupancy}."
    end
  end
end

#Method for getting answers to questions; mainly for Option 3.
def answer(to_question)
  puts to_question
  answer = gets.chomp
end

#Method for Option 3
def add_apt(address, monthly_rent, sqft, num_beds, num_baths, renters)
  Apartment.new(address, monthly_rent, sqft, num_beds, num_baths, renters)
end

#Method for Option 4
def add_tenant
end


#Next 6 lines: Instantiation
apt1A = Apartment.new("1A","1000", "500", "1", "1", nil)
apt1B = Apartment.new("1B","1200", "550", "1", "1", "John Smith")
apt1C = Apartment.new("1C","1700", "700", "2", "1", "Fred Frith")
apt2A = Apartment.new("2A","2000", "700", "2", "2", nil)
apt2B = Apartment.new("2B","1900", "600", "1", "2", nil)
apt2C = Apartment.new("2C","1200", "500", "1", "1", "Red Swift")

#Next 6 lines: Pushing instantiations to the 'apartments' array
apartments.push(apt1A)
apartments.push(apt1B)
apartments.push(apt1C)
apartments.push(apt2A)
apartments.push(apt2B)
apartments.push(apt2C)


#BEGINNING OF INTERFACE
menu_options = ["1. List all apartments.", "2. View an apartment's details.", "3. Add an apartment.", "4. Add a tenant to an apartment.", "5. Quit"]
puts "Welcome to the landlord app! Here are your menu options:"
list_menu_options(menu_options)
puts "Please enter the number of the menu option you wish to perform:"
option = gets.chomp

while option != "5"
  case option
    when "1" then list_apartments(apartments)
    when "2" then view_apt_details(apartments)
    when "3"
      new_address = answer("What is the address?")
      new_rent = answer("What is the monthly rent?")
      new_sqft = answer("What is the square footage?")
      new_bed = answer("How many bedrooms does it have?")
      new_bath = answer("How many bathrooms does it have?")
      new_renters = answer("Who lives there?")
      apartments.push(add_apt(new_address, new_rent, new_sqft, new_bed, new_bath, new_renters))
      puts "Apartment #{new_address} has been added to the list."
    # when 4 then puts
  end
  puts "Here are your menu options:"
  list_menu_options(menu_options)
  puts "Please enter the number of the menu option you wish to perform:"
  option = gets.chomp
end
