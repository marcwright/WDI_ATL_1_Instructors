require "pry"

class Person

	def initialize(name, age, gender)
	  @name = name
      @age = age
      @gender = gender
	end

	def name #this method allows us to GET the name variable out of the class instance--its called a 'GETTER'
      return @name
    end

    def age #this method allows us to GET the age variable out of the class instance--its called a 'GETTER'
    	return @age
    end

    def gender #this method allows us to GET the age variable out of the class instance--its called a 'GETTER'
    	return @gender
    end


end

Gabe = Person.new("Gabe Snyder", 30, "male")
Peggy = Person.new("Peggy Peterson", 24, "female")



class Apartment

	def initialize(address, rent, sqft, num_beds, num_baths, num_renters)
	@address = address
	@rent = rent
	@sqft = sqft
	@num_beds = num_beds
	@num_baths = num_baths
	@num_renters = num_renters
	end

	def address #this method allows us to GET the name variable out of the class instance--its called a 'GETTER'
      return @address
    end

    def rent #this method allows us to GET the age variable out of the class instance--its called a 'GETTER'
    	return @rent
    end

    def sqft #this method allows us to GET the age variable out of the class instance--its called a 'GETTER'
    	return @sqft
    end

    def num_beds #this method allows us to GET the name variable out of the class instance--its called a 'GETTER'
      return @num_beds
    end

    def num_baths #this method allows us to GET the age variable out of the class instance--its called a 'GETTER'
    	return @num_baths
    end

    def num_renters #this method allows us to GET the age variable out of the class instance--its called a 'GETTER'
    	return @num_renters
    end

end


# create apartments here
# here are some existing apartemtns:


apt1 = Apartment.new("116 South Westlake Ave, Apt H, Los Angeles, CA", 800, 650, 1, 1, 1)
apt2 =  Apartment.new("701 East 33rd Street, Baltimore, MD", 1200, 1345, 4, 2, 0)
apt3 = Apartment.new("2740 Saint Paul Street, Apt 2, Baltimore, MD", 650, 525, 0, 1, 0)
apt4 = Apartment.new("302 South Pine Street, Richmond, VA", 1500, 745, 2, 2, 2)

#I WILL NOW STORE ALL THIS DATA IN NESTED ARRAYS;\:

#create all the empty arrays first.
all_apt_addresses= []
apt1_array = []
apt2_array = []
apt3_array = []
apt4_array = []

#fill, then push apt 1 onto the array all-apt-addesses:
apt1_array.push(apt1.address, apt1.rent, apt1.sqft, apt1.num_beds, apt1.num_baths, apt1.num_renters)
all_apt_addresses.push(apt1_array)

apt2_array.push(apt2.address, apt2.rent, apt2.sqft, apt2.num_beds, apt2.num_baths, apt2.num_renters)
all_apt_addresses.push(apt2_array)

apt3_array.push(apt3.address, apt3.rent, apt3.sqft, apt3.num_beds, apt3.num_baths, apt3.num_renters)
all_apt_addresses.push(apt3_array)

apt4_array.push(apt4.address, apt4.rent, apt4.sqft, apt4.num_beds, apt4.num_baths, apt4.num_renters)
all_apt_addresses.push(apt4_array)


#also, made a hash here, of same info.

apt_hash = []
apt_hash << {apt1_address: apt1.address, apt1_sqft: apt1.sqft, apt1_rent: apt1.rent, apt1_bed: apt1.num_beds, apt1_bath: apt1.num_baths, apt1_renters: apt1.num_renters}
apt_hash << {apt2_address: apt2.address, apt2_sqft: apt2.sqft, apt2_rent: apt2.rent, apt2_bed: apt2.num_beds, apt2_bath: apt2.num_baths, apt2_renters: apt2.num_renters}
apt_hash << {apt3_address: apt3.address, apt3_sqft: apt3.sqft, apt3_rent: apt3.rent, apt3_bed: apt3.num_beds, apt3_bath: apt3.num_baths, apt3_renters: apt3.num_renters}
apt_hash << {apt4_address: apt4.address, apt4_sqft: apt4.sqft, apt4_rent: apt4.rent, apt4_bed: apt4.num_beds, apt4_bath: apt4.num_baths, apt4_renters: apt4.num_renters}


#heres the re-useable menu
def menu 
puts "@@@@@@@@@@@@ menu 1 @@@@@@@@@@@@@"
puts "@                               @"
puts "@  1 - List all Apartments      @"
puts "@  2 - View an Apt.s details    @"
puts "@  3 - Add an apartment         @"
puts "@  4 - Add a tenant to an Apt.  @"
puts "@  q - Quit                     @"
puts "@                               @"
puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
puts" "
end


# CREATING THE PROGRAM LOOP, if else loop, looking for numeric input from menu only. q is the end else.

menu_selection = "0"



while menu_selection != "q" #initial menu at start-up

  puts menu
  puts "enter a selection number :"
  menu_selection = gets.to_s.chomp
  puts " "
  puts "--------------------------------------------------------------------"

  
	case menu_selection
	
			when "1"

  			puts "LIST ALL APARTMENTS"

        puts "THE FOLLOWING APTs EXIST: "
        puts "(#)       (address)   (rent)    (sqft)   (beds #) (bath #) (curr. renters)   "
        puts all_apt_addresses.map.with_index {|w,i| "#{i} : #{w}" }
 			  puts " "
        puts "--------------------------------------------------------------------"
        

			when "2"

  			puts "VIEW AN APTS DETAILS"
        puts "Which apt were you interested in?"

        interested_in_num = gets.to_i
        
        puts "This apt. is at #{all_apt_addresses[interested_in_num][0]}." 
        puts "It's rent is $#{all_apt_addresses[interested_in_num][1]} a month."
        puts "It is approx. #{all_apt_addresses[interested_in_num][2]} square feet."
        puts "It has #{all_apt_addresses[interested_in_num][3]} beds and #{all_apt_addresses[interested_in_num][4]} bathrooms."
        puts "It currently has #{all_apt_addresses[interested_in_num][4]} tenants."
        puts " "
        puts "--------------------------------------------------------------------"

  
			when "3"


      puts "YOU WILL ADD AN APARTMENT"
      puts "Please enter full apt. address (address, apt, city, state, zip) :"
      new_address = gets.chomp

      
      puts "Please enter monthly rent:"
      rent_input = gets.chomp.to_i
      #HERE  #this should attempt to remove the $, from possible inputs.
      new_rent = rent_input

      puts "Please enter square feet:"
      new_sqft = gets.chomp.to_i

      puts "Please enter number of bedrooms:"
      new_num_beds = gets.chomp.to_i

      puts "Please enter number of bathrooms:"
      new_num_baths = gets.chomp.to_i

      puts "Please enter current number of tenants:"
      new_number_tenants = gets.chomp.to_i


      
#make the new apt
doink = Apartment.new(new_address, new_rent, new_sqft, new_num_beds, new_num_baths, new_number_tenants)



#DONT NEED THIS ANYMORE:
#newindexnum = all_apt_addresses.count + 1#finds the next number to use for the new array name


#make the new arrays
user_made_apt_array = []

#push new apt data onto new arrays, and new array into master array
user_made_apt_array.push(doink.address, doink.rent, doink.sqft, doink.num_beds, doink.num_baths, doink.num_renters)
all_apt_addresses.push(user_made_apt_array)

puts " "
puts "Apartment Added! :"
puts " "
puts all_apt_addresses[-1]
puts " "
puts "--------------------------------------------------------------------"
      














      #"apt" + newindexnum.to_s+".address"
#
#
      #"apt" + newindexnum.to_s + "_array".push("apt" + newindexnum.to_s+".address", "apt" + newindexnum.to_s+".rent", "apt" + newindexnum.to_s+".sqft", "apt" + newindexnum.to_s+".num_beds", "apt" + newindexnum.to_s+".num_baths", "apt" + newindexnum.to_s+"num_renters")
      #all_apt_addresses.push(apt1_array)
#
      #array.each_with_index do |element, i|
      #instance_variable_set "@array#{i + 1}", element










			when "4"




			puts " "
      puts "ADD A NEW TENANT TO AN APARTMENT :"
      puts " "
      
      #GET NEW PERSON INFORMATION
      puts "Person name: (First Last) "
      user_made_name = gets.chomp.capitalize

      puts "Person's age, in years :"
      user_made_age = gets.chomp.to_i

      puts "Persons gender (male or female)"
      user_made_gender = gets.chomp.downcase

      #CREATE THAT PERSON, USING ABOVE INFO
      user_made_person = Person.new(user_made_name, user_made_age, user_made_gender)

      #shows apt list then ask what apt

      puts "CURRENTLY AVAILABLE HOUSES:"

      not_crowded_apts_array = [] #make this new array first

      not_crowded_apts_array = all_apt_addresses.select { |a, b, c, d, e, f| f < 2}   #makes new array of available apts]

      puts not_crowded_apts_array.map.with_index {|w,i| "#{i} : #{w}" }
        puts " "
        puts "--------------------------------------------------------------------"

      puts "Which apt do you want this person to live in? Enter the # : "
      apt_choice = gets.chomp
        

      puts apt_choice
      puts user_made_person.name

      puts "You want to move into #{all_apt_addresses[apt_choice.to_i]} ?"

      old_tenant_count = all_apt_addresses[apt_choice.to_i][5]

      new_tenant_count =  old_tenant_count + 1 #creates new apt tenant count

      all_apt_addresses[apt_choice.to_i].pop #remove old tenant count

      all_apt_addresses[apt_choice.to_i].push(new_tenant_count) #push a new, updated count 

      puts "DONE!"


      


			else
	end
 
end

puts "goodbye"
















