require "pry"

building = []
tenants = []

#creates person class
class Person
  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end
#gets and sets instance variables
  attr_accessor :name
  attr_accessor :age
  attr_accessor :gender

end
#creates apt class
class Apartment
  def initialize(address, monthly_rent, sqft, num_beds, num_baths, renters)
    @address = address
    @monthly_rent = monthly_rent
    @sqft = sqft
    @num_beds = num_beds
    @num_baths = num_baths
    @renters = renters
  end

  attr_accessor :address
  attr_accessor :monthly_rent
  attr_accessor :sqft
  attr_accessor :num_beds
  attr_accessor :num_baths
  attr_accessor :renters

end
#function to create new instance
def newApt(unit, rent, sqft, bedrooms, bathrooms, tenant)
  Apartment.new(unit, rent, sqft, bedrooms, bathrooms, tenant)
end

#
building.push(newApt("1A", 1000, 500, "1 bedroom", "1 bathroom", nil))

building.push(newApt("1B", 1200, 550, "1 bedroom", "1 bathroom", "John Smith"))

building.push(newApt("1C", 1700, 700, "2 bedroom", "1 bathroom", "Fred Frith"))

building.push(newApt("2A", 2000, 700, "2 bedroom", "2 bathroom", nil))

building.push(newApt("2B", 1900, 600, "1 bedroom",
  "2 bathroom", nil))

building.push(newApt("2C", 1200, 500, "1 bedroom", "1 bathroom", "Red Swift"))
#function to create new person instance
def newPerson(name, age, gender)
  Person.new(name, age, gender)
end
#pushes persons to tenant array
tenants.push(newPerson("John Smith", 30, "male"))
tenants.push(newPerson("Fred Frith", 50, "male"))
tenants.push(newPerson("Red Swift", 40, "male"))

#iterates thru each array item and prints its address
  def list_apts(array)
    array.each do |i|
      if i.renters == nil
        puts "Apt #{i.address.to_s} is #{i.sqft.to_s} square feet, has #{i.num_beds} and #{i.num_baths}. It rents for $#{i.monthly_rent}."
        puts
      else puts "#{i.renters} lives in #{i.address}."
        puts
      end
    end
  end
#takes user input and uses conditional to only show details related to the apt w that apt number
  def show_apt(array)
    puts "Which apt would you like to see?"
        apt_to_view = gets.chomp.to_s
    array.each do |i|
       if i.address.to_s == apt_to_view
        puts "Apartment #{i.address} is a #{i.sqft} square foot #{i.num_beds} shitbox with #{i.num_baths}(s). It rents for $#{i.monthly_rent}."
        puts
      end
    end
  end
#saves user input to a variable
def get_input(question)
  puts question
  answer = gets.chomp
end

#menu written as function to reuse later
    def menu
      puts "Select an option by typing its number:\n
      1. List all apartments\n
      2. View an apartment's details\n
      3. Add an apartment\n
      4. Move a tenant into an apartment\n
      5. Quit"
    end

  choice = gets.chomp.to_i
  while choice != 5

    case choice
      when 1
        #list all apts
        puts "These are the apartments in the building:"
        list_apts(building)


      when 2
        #show apt details
        show_apt(building)

      when 3
        #add apt
        new_unit = get_input("What unit would you like to add?")

        new_rent = get_input("What is the rent (numbers only, please)").to_i

        new_sqft = get_input("How many square feet?").to_i

        new_beds = get_input("How many bedrooms?") + " bedrooms"

        new_baths = get_input("How many bathrooms?") + " bathrooms"

        new_tenant = get_input("Who is the new tenant?")

        building.push(newApt(new_unit, new_rent, new_sqft, new_beds, new_baths, new_tenant))

      when 4
        #add tenant to apt
        new_person_name = get_input("Who is the new renter?")
        new_person_age = get_input("How old is s/he?")
        new_person_gender = get_input("Male or female?")
        desired_apt = get_input("Which apartment is s/he renting?")
        tenants.push(newPerson(new_person_name, new_person_age, new_person_gender))
        def move_in(array, apt, name)
          array.each do |i|
            if i.address.to_s == apt
              i.renters = name
            end
          end
        end
        move_in(building, desired_apt, new_person_name)

      when 5
        #quit
        choice = 5
      # else
      #   puts "Please make your selection by typing a numer 1-5"

    end
    menu()
    choice = gets.chomp.to_i
  end

binding.pry
