# You are a landlord in need of an app that will track your apartments and tenants

require 'pry'

#Define classes for Person and Apartment

class Person
  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end
end

class Apartment
  @@apt_list = []
  def initialize (address, monthly_rent, sqft, num_beds, num_baths, renters)
    @address = address
    @monthly_rent = monthly_rent
    @sqft = sqft
    @num_beds = num_beds
    @num_baths = num_baths
    @renters = renters
    @@apt_list.push([@address, @monthly_rent, @sqft, @num_beds, @num_baths, @renters])
end

  def address
    return @address
  end

  def apt_list
    return @@apt_list
  end

  def view_apt
    puts "This apartment is at #{address}"
  end

end

# PART 2 - Creating the program functionality and menu display

#The program should instantiate several new apartments at the outset

apt_1 = Apartment.new("201 Q St NE", 2500, 1100, 2, 2, ["Brett"])
apt_2 = Apartment.new("1635 C St SE", 2200, 1500, 2, 1.5, ["Lara"])
apt_3 = Apartment.new("729 Otis Pl NW", 2950, 2100, 3, 1.5, ["Mark, Paymon"])
#The user should be presented with the following options:
#Listing all apartments. List all of the apartments. If the apartment is unoccupied you should say something like "Apt 1A is 750 sqft and has 1 bed and 1 bath. It costs $2500 a month". If an apartment is occupied by a tenant you should say something like: Travis lives in Apt 1A.

main_listing = apt_1.apt_list
menu_choice = true
while menu_choice != "5"

  puts "What would you like to do?"
  puts "(1) List all apartments"
  puts "(2) View an apartment's details"
  puts "(3) Add an apartment"
  puts "(4) Add a tenant to an apartment"
  puts "(5) Quit"
  menu_choice = gets.chomp

  case menu_choice
  when "1"
    puts main_listing
  when "2"
    puts "Which apt do you want to look at?"
    apt_choice = gets.to_i + 1
    puts main_listing[apt_choice]
  when "3"
    puts "Address?"
    address = gets.chomp
    puts "Monthly rent?"
    monthly_rent = gets.to_i
    puts "Square feet?"
    sqft = gets.to_i
    puts "Number of beds?"
    num_beds = gets.to_i
    puts "Number of baths?"
    num_baths = gets.to_i
    puts "Who's renting?"
    renters = gets.chomp
    main_listing.push([address, monthly_rent, sqft, num_beds, num_baths, renters])
  when "4"

  when "5"
    menu_choice = "5"
  end
end



#Add a tenant to the apartment. Make sure to get the appropriate input from the user to create your person. Make sure to ask which apartment they want to live in. Add the person to that apartment. NOTE: Only two people can live in an apartment.

