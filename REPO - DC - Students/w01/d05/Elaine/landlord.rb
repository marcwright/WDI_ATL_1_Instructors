class Person

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end

end

class Apartment

  def initialize(address, monthly_rent, sqft, num_beds, num_baths, renters)
    @address = address
    @monthly_rent = monthly_rent
    @sqft = sqft
    @num_beds = num_beds
    @num_baths = num_baths
    @renters = renters
  end

end

apartments = []

apt_1 = Apartment.new("101 Main Street, Apt. #808", 2100, 1160, 2, 2, "0")

apt_2 = Apartment.new("101 Main Street, Apt. #501", 1750, 950, 1, 1, "0")

apt_3 = Apartment.new("110 Main Street, Apt. #130", 1600, 850, 1, 1, "1")

apartments.push({
  Address: "101 Main Street, #808",
  Rent: "2100",
  Square_Feet: "1160",
  Number_Bedrooms: "2",
  Number_Bathrooms: "2",
  Renters: "0"
})

apartments.push({
  Address: "101 Main Street, #501",
  Rent: "1750",
  Square_Feet: "950",
  Number_Bedrooms: "1",
  Number_Bathrooms: "1",
  Renters: "0"
})

apartments.push({
  Address: "110 Main Street, #130",
  Rent: 1600,
  Square_Feet: "850",
  Number_Bedrooms: "1",
  Number_Bathrooms: "1",
  Renters: "Bob"
})

selection = 0

while selection != 5

  puts ""
  puts "Please select from the following menu options. Enter the number of your selection."
  puts "(1) Listing all apartments"
  puts "(2) View an an apartment's details"
  puts "(3) Add an apartment"
  puts "(4) Add a tenant to an apartment"
  puts "(5) Quit"

  selection = gets.to_i

  if selection != 5

    case selection
    when 1

      apartments.each do |each_apartment|
        if each_apartment[:Renters] == "0"
          puts "#{each_apartment[:Address]} is #{each_apartment[:Square_Feet]} sqft and has #{each_apartment[:Number_Bedrooms]} bedroom(s) and #{each_apartment[:Number_Bathrooms]} bath(s). It costs $#{each_apartment[:Rent]} a month."
        else
          puts "#{each_apartment[:Renters]} lives in Apt #{each_apartment[:Address]}."
        end

      end

    when 2

      apartments.each do |each_apartment|
        if each_apartment[:Renters] == "0"
          puts "Apt #{each_apartment[:Address]} is #{each_apartment[:Square_Feet]} sqft and has #{each_apartment[:Number_Bedrooms]} bedroom(s) and #{each_apartment[:Number_Bathrooms]} bath(s). It costs $#{each_apartment[:Rent]} a month."
        else
          puts "#{each_apartment[:Renters]} lives in Apt #{each_apartment[:Address]}."
        end

      end

    when 3
      puts "What is the address of the apartment, including apartment number?"
      add_address = gets.chomp
      puts "What is the monthly rent? Enter numbers only."
      add_rent = gets.chomp
      puts "What is the square feet? Enter numbers only."
      add_sqft = gets.chomp
      puts "How many bedrooms?"
      add_beds = gets.chomp
      puts "How many baths?"
      add_baths = gets.chomp
      puts "Any current renters? Enter the name(s) of the renter(s) or enter 0 if none."
      add_renters = gets.chomp

      apartments.push [{
        :Address => add_address,
        :Rent => add_rent,
        :Square_Feet => add_sqft,
        :Number_Bedrooms => add_beds,
        :Number_Bathrooms => add_baths,
        :Renters => add_renters
      }]


    when 4
      puts "Enter the address of the apartment you would like to rent."
      apt_selected = gets.chomp

      apartments.each do |apartment|
        if apt_selected == apartment[:Address]
          puts "Enter the names of up to 2 renters."
          apartment[:Renters] = gets.chomp
          puts "Apt apartment[:Address] has been confirmed as rented."
        else
        end

      end

    end

  end
end


