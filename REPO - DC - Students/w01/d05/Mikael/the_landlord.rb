# require 'pry'

def prompt_user(query)
  puts query
  return gets.chomp.downcase
end

class Person

  def initialize(name,age,gender)
    @name = name
    @age = age
    @gender = gender
  end

  def name
    return @name
  end

  def set_name=(name)
    @name = name
  end

  def age
    return @age
  end

  def gender
    return @gender
  end

end


class Apartment

  def initialize(address,rent,size,beds,baths)
    @address = address
    @monthly_rent = rent
    @sqft = size
    @num_beds = beds
    @num_baths = baths
    @renters = []
  end

  def details
    return "This apartment is at #{@address}. It is a #{@num_beds} bedroom, #{@num_baths} bath, #{@sqft} square ft space. The rent is $#{@monthly_rent} per month."
  end

  def address
    return @address
  end

  def rent
    return @monthly_rent
  end

  def set_rent(rent)
    @monthly_rent
  end

  def size
    return @sqft
  end

  def beds
    return @num_beds
  end

  def baths
    return @num_baths
  end

  def renters
    return @renters
  end

  def add_tenant
    if @renters.length == @num_beds
      puts "This apartment is full."
    else
      name = prompt_user("What is the renter's name?")
      age = prompt_user("How old are they?")
      gender = prompt_user("What is their gender?")
      @renters.push(Person.new(name, age, gender))
    end
  end

end

townhouse = Apartment.new("418 N. 31st St. Apt A", 650, 1250, 4, 3.5)
condo = Apartment.new("2512 Brown St", 775, 1400, 4, 3)
roomshare = Apartment.new("123 Sesame Street", 675, 900, 3, 2.5)

apartments = [townhouse, condo, roomshare]

puts "Welcome to Davis Apartment Homes!"

while true
  puts "You can [list] all apartments availabe, [view] an apartment's details, [add] an apartment, add a [tenant] to an apartment, or [quit]."

  input = prompt_user("What would you like to do?")
  break if input == "quit"

  case input
  when "list"
    i = 0
    apartments.each do |apt|
        puts "Apt #{i + 1}: " + apt.address
        if apt.renters.length == 0
          puts "This is a #{apt.beds} bedroom, #{apt.baths} bath, #{apt.size} square ft space. The rent is $#{apt.rent} per month."
        else
          apt.renters.each do |ten|
            puts "#{ten.name} lives here."
          end
        end
      i += 1
    end
  when "view"
    choice = prompt_user("Please enter the number of the apartment you would like to see details for.").to_i
    if choice < apartments.length
      puts apartments[choice - 1].details
    else
      puts "That is not a valid apartment number."
    end
  when "add"
    addy = prompt_user("What is the address?")
    rent = prompt_user("How much is the rent?")
    size = prompt_user("What size is this apartment in square feet?").to_i
    beds = prompt_user("How many bedrooms are in this apartment?").to_i
    baths = prompt_user("How many bathrooms are in this apartment?").to_i
    new_apt = Apartment.new(addy, rent, size, beds, baths)
    resp = prompt_user("How many people live here?").to_i
    resp.times do
      new_apt.add_tenant
    end
    apartments.push(new_apt)
  when "tenant"
    num = prompt_user("Which apartment number does the tenant live in?").to_i
    if num < apartments.length
      apartments[num - 1].add_tenant
    else
      puts "That is not a valid apartment number."
    end
  else
    puts "Sorry, that's not a valid option. Please enter [list], [view], [add], [tenant], or [quit]."
  end
end

puts "Goodbye!"

# binding.pry
