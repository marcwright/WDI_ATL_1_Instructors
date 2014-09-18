require 'pry'

#======================================
# Helper Methods and initial variables
#======================================

# for semantic gathering of user input
def get_answer_to(question)
  puts question
  answer = gets.chomp
  return answer
end

# lists all apartments
def list_apartments(apartments)
  apartments.each_with_index do |apartment, index|
    puts "Apartment #{index + 1} is at #{apartment.address}."
  end
  # returning nil so we don't get annoying terminal output of entire array
  # after printing all the addresses
  return nil
end

# for use when landlord adds an apartment
def add_apartment(apartment_array)
  address        = get_answer_to("What's the address?")
  rent           = get_answer_to("How much is the monthly rent?")
  bedroom_count  = get_answer_to("How many bedrooms does this place have?")
  bathroom_count = get_answer_to("And how many bathrooms?")
  sqft           = get_answer_to("One last thing; how many square feet?")
  new_apt = Apartment.new(address, rent, sqft, bedroom_count, bathroom_count)
  apartment_array << new_apt
  puts ""
  puts "Great. You've added #{new_apt.address} to your collection of apartments."
end

# creates an empty array into which we will push newly instantiated apts
landlords_apts = []

#============================
# Defining the Person class
#============================
class Person
  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end

  def name
    return @name
  end

  def name=(name)
    @name = name
    return @name
  end

  def age
    return @age
  end

  def age=(age)
    @age = age
    return @gender
  end

  def gender
    return @gender
  end

  def gender=(gender)
    @gender = gender
    return @gender
  end
end

#=============================
# Defining the Apartment class
#=============================
class Apartment
  def initialize(address, monthly_rent, sqft, num_beds, num_baths)
    @address      = address
    @monthly_rent = monthly_rent
    @sqft         = sqft
    @num_beds     = num_beds
    @num_baths    = num_baths
    @renters      = []
  end

  # semantics!
  def is_occupied?
    if renters.size > 0
      return true
    else
      return false
    end
  end

  def print_details
    if is_occupied?
      puts "#{renters.first.name} lives at #{address}."
    else
      puts "The apartment at #{address} is a #{num_beds} bedroom, " +
           "#{num_baths} bath masterpiece for #{monthly_rent}/month."
    end
  end

  #
  def prints_tenant_names
    renters.each do |renter|
      puts renter.name
    end
  end

  def add_tenant
    if renters.size < 2
      name   = get_answer_to("What's the new tenant's name?")
      age    = get_answer_to("How old is this person?")
      gender = get_answer_to("And what gender do they identify with?")
      person = Person.new(name, age, gender)
        renters << person
      puts "#{person.name} has signed a lease for the apartment at #{address}."
    else
      puts "This apartment can't take more than 2 people. It's pea-sized."
    end
  end

  def renters
    @renters
  end

  def address
    return @address
  end

  def address=(address)
    @address = address
  end

  def monthly_rent
    return @monthly_rent
  end

  def monthly_rent=(monthly_rent)
    @monthly_rent = monthly_rent
  end

  def sqft
    return @sqft
  end

  def sqft=(sqft)
    @sqft = sqft
  end

  def num_beds
    return @num_beds
  end

  def num_beds=(num_beds)
    @num_beds = num_beds
  end

  def num_baths
    return @num_baths
  end

  def num_baths=(num_baths)
    @num_baths = num_baths
  end
end

#==========================================
# Seed Data (Instantiated objects to give our program stuff to play with out of the box)
#==========================================
apt_1 = Apartment.new("452 Dean Street, #3, Brooklyn, NY", 2700, 800, 2, 1)
apt_2 = Apartment.new("555 Fake Street", 3000, 1000, 4, 1)
apt_2.renters << Person.new("Mallory", 25, "female")
landlords_apts << apt_1
landlords_apts << apt_2

#========================================
# Menu and Program Control Flow
#========================================

def list_options
  puts ""
  puts "Enter the NUMBER from the list of actions below:"
  puts ""
  puts "1. List all apartments"
  puts "2. View an apartment's details"
  puts "3. Add an apartment"
  puts "4. Add a tenant to an apartment"
  puts "5. Quit"
  puts ""
end

answer = "abitrary string!"

while answer != '5'
  list_options
  answer = gets.chomp
  case answer
  when '1'
    list_apartments(landlords_apts)
  when '2'
    puts "Which apartment would you like to view? (Choose a number.)"
    list_apartments(landlords_apts)
    index_of_apt_to_view = gets.chomp.to_i - 1
    landlords_apts[index_of_apt_to_view].print_details
  when '3'
    add_apartment(landlords_apts)
  when '4'
    puts "Which apartment would you like to add a tenant to? (Choose a number.)"
    list_apartments(landlords_apts)
    index_of_which_apt_to_add_to = gets.chomp.to_i - 1
    landlords_apts[index_of_which_apt_to_add_to].add_tenant
  when '5'
    puts "Until next time"
  else
    puts "You didn't provide a valid response."
  end
end



