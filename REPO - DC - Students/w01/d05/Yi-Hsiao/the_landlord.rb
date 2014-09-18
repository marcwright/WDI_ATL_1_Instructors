# ##The Landlord

# ####Prompt:
# You are a landlord in need of an app that will track your apartments and tenants.

# #### Part 1 - Creating the classes

# Define classes for __Person__ and __Apartment__

# A person should have the following attributes:

# * name
# * age
# * gender


# An apartment should have the following attributes:

# * address (a single string including floor and unit numbers if applicable)
# * monthy_rent
# * sqft
# * num_beds
# * num_baths
# * renters (the person or persons living in the apartment)

# Okay, now take 20 minutes to first read-through and think about the methods & behavior outlined below.

# #### Part 2 - Creating the program functionality & menu display

# * The program should instantiate several new apartments at the outset.
# * The user should then be presented with the following menu options
#   * Listing all apartments
#   * View an apartment's details
#   * Add an apartment
#   * Add a tenant to an apartment
#   * Quit
# * The program should return to the menu until the user quits


# #### View apartment details
# * Tell the user the address, monthly_rent, sqft, num_beds, num_baths, and renters

# #### Adding an apartment
# * Make sure to get the appropriate input from the user when creating an apartment

# #### Adding a tenant to an apartment
# * Make sure to get the appropriate input from the user to create your person
# * Make sure to ask which apartment they want to live in
# * Add the person to that apartment
# * __NOTE:__ Only two people can live in an apartment due to zoning laws (at least until you get to the bonus).

# #### Listing the apartments
# * List all of the apartments
# * If the apartment is unoccupied(no renters) you should say something like:
#   `Apt 1A is 750 sqft and has 1 bed and 1 bath. It costs $2500 a month`
# * If the apartment is occupied by a tenant, you should say something like:
#   `Travis lives in Apt 1A`


# ### Bonus
# * Increase the number of people that can live in an apartment to up to the number of bedrooms in the apartment. Adjust the rest of your program accordingly.
# * Add functionality so you can evict a tenant from an apartment.

require "pry"

class Person
  attr_reader :name, :age, :gender

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end
end

class Apartment
  @@list ||= []
  def self.list; @@list; end

  attr_reader :address, :monthly_rent, :sq_ft, :num_beds, :num_baths
  attr_accessor :renters

  def initialize(address, monthly_rent, sq_ft, num_beds, num_baths)
    @address = address
    @monthly_rent = monthly_rent
    @sq_ft = sq_ft
    @num_beds = num_beds
    @num_baths = num_baths
    @renters = []
    @@list << self
  end

  def self.find_apt(apt_address)
    @@list.select { |apt| apt.address.casecmp(apt_address) == 0 }[0]
  end
end

def get_valid_answer(question, valid_answers)
  # checks and validates if user input matches possible answers, 'valid_answers'
  # valid_answers can be an Array of possible answers or a regex string.

  puts question
  user_input = gets.chomp

  answer = case valid_answers
    when Array then valid_answers.detect do |possible_answer|
      # checks if string is a case-insensitive match or if numeric values are equal
      possible_answer.is_a?(String) ? possible_answer.casecmp(user_input) == 0 : possible_answer == user_input.to_f
    end
    when Regexp then user_input.match(valid_answers) { |match| match[0] }
  end
  if answer
    return answer
  else
    puts "Sorry, I didn't understand that."
    get_valid_answer(question, valid_answers)  # ask question again, if an unexpected answer is given.
  end
end

def add_apartment
  # ask users info to add an apartment to our listings (address, monthly rent, square footage, # beds/baths)
  address = get_valid_answer("What is the apartment number you wish to add (e.g. 1234 or 1A)?", /^[0-9]+.+/)

  # checks if address already exists before creating a new apartment record
  if Apartment.find_apt(address)
    puts "We already have a record of this apartment number."
  else
    pos_int_regex = /^([0-9]+,)*[0-9]+(\.[0-9]+)?$/ # matches positive numbers with decimals or comma separators

    monthly_rent = get_valid_answer("How much is the monthly rent (in USD)?", pos_int_regex).gsub(",", "_").to_i
    sq_ft = get_valid_answer("How big is the apartment (in sq. ft.)?", pos_int_regex).gsub(",", "_").to_i
    num_beds = get_valid_answer("How many beds are there?", pos_int_regex).gsub(",", "_").to_i
    num_baths = get_valid_answer("How many bathrooms are there?", pos_int_regex).gsub(",", "_").to_i
    Apartment.new(address, monthly_rent, sq_ft, num_beds, num_baths)
    puts "Apt #{address} is in the directory now."
  end
end

def add_tenant
  # apts are available if they have a free bedroom
  apt_list = Apartment.list
  avail_apts = apt_list.collect { |apt| apt.address if apt.renters.length < apt.num_beds }.compact

  if avail_apts.empty?
    puts "Sorry, there's no availability in the building right now."
  else
    # add a new tenant to an apartment with their name, age, and gender info
    name = get_valid_answer("What is the tenant's name you wish to add?", /[a-z\s-]+/i).split.map(&:capitalize).join(" ")  # capitalizes name
    age = get_valid_answer("How old is #{name} (in years)?", /^[0-9]+$/).to_i
    gender = get_valid_answer("What is #{name}'s gender (M/F)?", ["M", "F"])
    tenant = Person.new(name, age, gender)

    # ask the user to pick an available apartment.  re-ask until user chooses an avail. apt.
    tenant_apt_choices = "\n* " + avail_apts.join("\n* ")
    apt_options = avail_apts + ["CANCEL"]
    live_apt_answer = get_valid_answer("Which apartment does #{name} want to live in (Or type 'CANCEL' to cancel)? #{tenant_apt_choices}", apt_options)
    Apartment.find_apt(live_apt_answer).renters << tenant unless live_apt_answer == "CANCEL"
    puts "#{name} is a tenant of #{live_apt_answer} now."
  end
end

def evict_tenant
  # evict tenant from apartment (removes them from Apartment.renters array)

  apt_w_tenants = Apartment.list.collect { |apt| apt.address if apt.renters.length > 0 }.compact

  if apt_w_tenants.empty?
    puts "Sorry, there's nobody to evict from the apartment right now."
  else
    evict_apt_options = "\n* " + apt_w_tenants.join("\n* ")
    evict_apt_answer = get_valid_answer("Which apartment do you wish to evict? #{evict_apt_options}", apt_w_tenants)

    apt = Apartment.find_apt(evict_apt_answer)
    tenants = apt.renters.dup
    num_tenants = apt.renters.length

    # if only one tenant
    if num_tenants == 1
      evict_tenant_answer = get_valid_answer("Do you wish to evict #{tenants[0].name} (Y/N/Or type 'CANCEL' to cancel action)?", ["Y", "N", "CANCEL"])
      apt.renters.delete_at(0) unless evict_tenant_answer == "CANCEL"
      puts "#{tenants[0].name} no longer lives in apt #{evict_apt_answer} now."
    else
      tenant_names = tenants.each_with_index.map { |renter, index| "#{index+1}. #{renter.name}, #{renter.age} years old, #{renter.gender}" }
      tenant_names = "\n" + tenant_names.join("\n")

      index_adj = 1  # adjusts 0-index, so user sees a numbered list starting from 1 that they can select users to evict.
      evict_options = (index_adj..num_tenants).to_a + ["CANCEL"]  # add cancel to list of possible options

      evict_tenant_answer = get_valid_answer("Which tenant do you wish to evict (Or type 'CANCEL' to cancel action)? #{tenant_names}", evict_options)
      evicted_renter_index = evict_tenant_answer - index_adj
      apt.renters.delete_at(evicted_renter_index) unless evict_tenant_answer == "CANCEL"
      puts "#{tenants[evicted_renter_index].name} no longer lives in apt #{evict_apt_answer} now."
    end
  end
end

def list_apts
  # prints out a directory of all the apartments in the building based on floor number

  apt_addresses = Apartment.list.collect { |apt| apt.address }
  puts "Apartments in the directory: #{apt_addresses.join(", ")}"
end

def view_apt
  # prints info about a specific apartment

  avail_apts = Apartment.list.collect { |apt| apt.address }
  list_apts = "\n* " + avail_apts.join("\n* ") # concatenated list of apts in directory
  address = get_valid_answer("What is the address of the apartment you wish to view? #{list_apts}", avail_apts)

  # if user selects option to see a directory of apartments, show apartments, then ask for apartment address again
  apt = Apartment.find_apt(address)
  tenants = apt.renters

  # if apartment is unoccupied prints important details about the apt for prospective tenants
  if tenants.length == 0
    bed_correct_plural = apt.num_beds == 1 ? "bed" : "beds"
    bath_correct_plural = apt.num_baths == 1 ? "bath" : "baths"
    apt_details = "Apt #{apt.address} is #{apt.sq_ft} sq ft, has #{apt.num_beds} #{bed_correct_plural}, and #{apt.num_beds} #{bath_correct_plural}. "
    apt_details += "It costs $#{apt.monthly_rent} month."
    puts apt_details
  else
  # if apt is occupied, prints current tenants in the apt
    renter_names = tenants.collect { |renter| renter.name }
    renter_plural = case renter_names.length
      when 1 then "#{renter_names[0]} lives"
      when 2 then "#{renter_names[0]} and #{renter_names[1]} live"
      when 3 then "#{renter_names[0...-1].join(", ")}, and #{renter_names[-1]} live"
    end

    puts "#{renter_plural} in apt #{apt.address}."
  end
end

def show_menu
# prints a menu of options for this program

  menu_text = []
  menu_text << "L - List all apartments"
  menu_text << "V - View an apartment's details"
  menu_text << "A - Add an apartment"
  menu_text << "T - Add a tenant to an apartment"
  menu_text << "E - Evict a tenant from an apartment"
  menu_text << "Q - Quit"
  menu_options = menu_text.collect { |line| line[0] }

  while true
    puts
    menu_choice = get_valid_answer(menu_text, menu_options)
    puts

    case menu_choice
      when "L" then list_apts
      when "V" then view_apt
      when "A" then add_apartment
      when "T" then add_tenant
      when "E" then evict_tenant
      when "Q" then puts "Goodbye, thanks for checking out our apartments."
    end

    break if menu_choice == "Q"
  end
end


apt_1a = Apartment.new("1000", 2000, 557, 1, 1)
apt_1b = Apartment.new("1007", 2200, 704, 2, 2)
apt_1c = Apartment.new("1A", 3225, 965, 3, 3)

person_a = Person.new("Yi-Hsiao", 29, "M")
person_b = Person.new("Wendy", 25, "F")

apt_1b.renters << person_a
apt_1b.renters << person_b

show_menu
