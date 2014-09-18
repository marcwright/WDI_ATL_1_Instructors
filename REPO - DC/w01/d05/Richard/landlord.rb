#=================================================
#=================================================
=begin

  ##The Landlord

####Prompt:
You are a landlord in need of an app that will track your apartments and tenants.

#### Part 1 - Creating the classes

Define classes for __Person__ and __Apartment__

A person should have the following attributes:

* name
* age
* gender

An apartment should have the following attributes:

* address (a single string including floor and unit numbers if applicable)
* monthy_rent
* sqft
* num_beds
* num_baths
* renters (the person or persons living in the apartment)

Okay, now take 20 minutes to first read-through and think about the methods & behavior outlined below.

#### Part 2 - Creating the program functionality & menu display

* The program should instantiate several new apartments at the outset.
* The user should then be presented with the following menu options
  * Listing all apartments
  * View an apartment's details
  * Add an apartment
  * Add a tenant to an apartment
  * Quit
* The program should return to the menu until the user quits

#### View apartment details
* Tell the user the address, monthly_rent, sqft, num_beds, num_baths, and
renters

#### Adding an apartment
* Make sure to get the appropriate input from the user when creating an apartment

#### Adding a tenant to an apartment
* Make sure to get the appropriate input from the user to create your person
* Make sure to ask which apartment they want to live in
* Add the person to that apartment
* __NOTE:__ Only two people can live in an apartment due to zoning laws (at least until you get to the bonus).

#### Listing the apartments
* List all of the apartments
* If the apartment is unoccupied(no renters) you should say something like:
  `Apt 1A is 750 sqft and has 1 bed and 1 bath. It costs $2500 a month`
* If the apartment is occupied by a tenant, you should say something like:
  `Travis lives in Apt 1A`

### Bonus
* Increase the number of people that can live in an apartment to up to the number of bedrooms in the apartment. Adjust the rest of your program accordingly.
* Add functionality so you can evict a tenant from an apartment.
=end
##########################################################


require 'pry'
class Person

  attr_accessor :name, :age, :gender

  def initialize(name, age, gender)
  @name = name
  @age = age
  @gender = gender
  end

end

class Apartment

attr_accessor :address, :rent, :sqft, :num_beds, :num_baths, :tenants, :total_listings

  def initialize(apartment)
    @address = apartment[:address]
    @rent = apartment[:rent]
    @sqft =  apartment[:sqft]
    @num_beds = apartment[:num_beds]
    @num_baths = apartment[:num_baths]
    @tenants = apartment[:tenants]
  end

    # puts address to screen if option is selected
  def list_address
    if @tenants == []
      puts "#{@address} is available."
    else
    end
  end

  def list_all_addresses(index)
      puts "#{index + 1}.) #{@address}"
  end


     # Add some conditional features, ie- multiple bathrooms add plurals
  def list_details
      puts "**The Apartment at #{self.address()} has a montly rent of £#{self.rent()}. \nThe square footage is #{self.sqft()} sqft with #{self.num_beds()} bedrooms and #{self.num_baths()} bathroom(s)."
  end

end

# turning apt_1,2, & 3 into manageable Class arrays.
  apt_1 = Apartment.new({
    address: "52 Rathmell Drive, London SW4 8JN, UK",
    rent:500,
    sqft: 750,
    num_beds: 2,
    num_baths: 2,
    tenants: []
    })


  apt_2 = Apartment.new({
    address: "1 Strollamus, Broadford, Isle of Skye, Highland IV49 9AL, UK",
    rent: 750,
    sqft: 900,
    num_beds: 2,
    num_baths: 1,
    tenants: []

    })
  apt_3 = Apartment.new({
    address: "8 Oakfield Road, Londonderry, Derry BT48, UK",
    rent: 950,
    sqft: 1300,
    num_beds: 3,
    num_baths: 2,
    tenants: []
    })

class Listings
  attr_accessor :index, :total_listings

  def initialize
    @total_listings = []
    @index = 0
  end

  def add_listing(apartment)
    self.total_listings.push(apartment)
  end

  def listing(index)
      return self.total_listings[index]
  end

  def list_all_addresses
    while @index < total_listings.length
    puts self.listing(@index).list_all_addresses(@index)
    @index += 1
  end
  return
  end

  def list_address
    while @index < total_listings.length
       self.listing(@index)
        puts self.listing(@index).list_address()
        @index += 1
    end
    @index=0
    return
  end

  def list_details
      while @index < total_listings.length
       self.listing(@index)
        puts self.listing(@index).list_details()
        @index += 1
      end
  @index=0
  return
  end
end


#=================================================
#
#             MENU OPTIONS
#
#=================================================

total_listings = Listings.new
total_listings.add_listing(apt_1)
total_listings.add_listing(apt_2)
total_listings.add_listing(apt_3)

menu = true
menu_count = 0

  puts  "Is there anything I can help you with?"
  puts  ""

while menu
  if menu_count > 0
    puts "What else can I help you with?"
  else
  end
puts  "1.) Perhaps a listing of all the available apartments?"
puts  "2.) A listing of an apartments details?"
puts  "3.) Would you like to add an apartment to our listings?"
puts  "4.) Would you like to add a tenant to an existing apartment?"
puts  "5.) There is nothing you can help me with."
option = gets.chomp.to_i

  case option

    when 1
      puts total_listings.list_address
    when 2
      puts total_listings.list_details
    when 3
      puts "Great! Let's get your apartment on the market"
      puts "What's the address of the apartment? (Street address, City, State/Provenance Abrv)"
        new_add = gets.chomp
      puts "How much would you like the montly rent to be? (In £)"
        new_rent = gets.chomp.to_i
      puts "What is the total square footage?"
        new_sqft = gets.chomp.to_i
      puts "How many bedrooms are there?"
        new_beds = gets.chomp.to_i
      puts "How many bathrooms are there?"
        new_baths = gets.chomp.to_i
      puts "Finally, how many tenants can it hold?"
        new_renters = gets.chomp.to_i
          if new_renters > new_beds
            puts "I'm sorry, but regulations mandate the the number of tenants must not" +
              "exceed the number of available bedrooms. Please entry a different amount" +
              "of alloted renters."
                new_renters = gets.chomp.to_i
          else
          end
        new_apt = Apartment.new({address: new_add, rent: new_rent, sqft:new_sqft, num_beds: new_beds, num_baths: new_baths, tenants: []})

        total_listings.add_listing(new_apt)
        list_total = total_listings.total_listings.length
        puts "#{new_apt.list_details} will be placed on the market! Congrats!"

        puts "The total amount of listings now on the market through"
        puts "Richard's Radical Real is #{list_total}!"
    when 4
      puts "So you'd like to rent an apartment!? great!"
      puts "Which apartment address?"
      puts total_listings.list_all_addresses
      add_ten = gets.chomp
      puts "What is the tenant's name?"
        new_ten = gets.chomp

          if add_ten.downcase.include? address:
            total_listings.total_listings.push(tenants:[new_ten])
          else
          end
      # def add_tenant(add_ten, new_ten, total_listings)
        # total = total_listings.total_listings.each_with_index do |ten_index, index|
        #   if index == add_ten -
        #     binding.pry
        #   total_listings.total_listings[add_ten.to_i-1].push(tenants:[new_ten])
        #   end
        #   puts total
        # end




    else
      menu = false
    end
menu_count += 1
end
