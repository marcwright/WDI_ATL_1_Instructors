class Person
  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end

  def name
    return @name
  end

  def talk
    return "Hi! I'm #{@name}"
  end
end


class Apartment
  def initialize(address, monthly_rent, sqft, num_beds, num_baths, renters=[])
    @address = address
    @monthly_rent = monthly_rent
    @sqft = sqft
    @num_beds = num_beds
    @num_baths = @num_baths
    @renters = renters
  end

  def return_address
    if @renters.empty? == true
      return "This apartment is located at #{@address}. It is #{@sqft} square feet, has #{@num_beds} beds and #{@num_baths} baths."
    elsif @renters.length == 1
      return "#{@renters[0].name} lives here. (#{@address})"
    elsif @renters.length == 2
      return "#{@renters[0].name} and #{@renters[1].name} live here. (#{@address})"
    end
  end

  def address
    return @address
  end

  def add_renter=(renta)
      @renters.push(renta)
  end

  def return_details
    return "This apartment is located at #{@address}. It is #{@sqft} sq ft. It has #{@num_baths} bathrooms and #{@num_beds} beds."
  end
end

jessica_alba = Person.new("Jessica Alba", 32, "female")
travis = Person.new("Travis", 26, "male")
stanley_kubrick = Person.new("Stanley", 85, "male")

morningside_heights = Apartment.new("1500 116th St., New York City, NY unit 605", 2100, 500, 1, 1, [travis, stanley_kubrick])
green_point = Apartment.new("200 5th st., Brooklyn NYC, NY unit 202", 1300, 600, 2, 1, [jessica_alba])
williamsburg = Apartment.new("1324 16th st., Brooklyn NYC, NY unit 22", 4500, 800, 3, 1, [])

apartments = [morningside_heights, green_point, williamsburg]

in_operation = true

while in_operation == true
  puts "*************************"
  puts "APARTMENT RENTAL PROGRAM!"
  puts "Choose from the menu what you want to do."
  puts " "
  puts "(1) View listings"
  puts "(2) View apartment details"
  puts "(3) Add a listing"
  puts "(4) Add a tenant"
  puts "(q) Quit"
  puts " "
  user_selection = gets.chomp

  case user_selection
  when "1"
    apartments.each do |apartment|
      puts apartment.return_address + "\n"
    end
  when "2"
    puts "Which apartment do you want to see?"
    count = 1
    apartments.each do |apartment|
      puts "(#{count}) #{apartment.address}"
      count += 1
    end
    choice = gets.chomp.to_i
    puts apartments[choice-1].return_details + "\n"

  when "3"
    puts "Please enter appropriate values!"
    puts "What is the address? (include unit)"
    addy = gets.chomp
    puts "What is the square footage of the apartment?"
    sqft = gets.chomp.to_i
    puts "How many beds in this apartment?"
    num_beds = gets.chomp.to_i
    puts "How many bathrooms?"
    num_baths = gets.chomp.to_i
    puts "Name of resident?"
    name = gets.chomp
    puts "Age of resident?"
    age = gets.chomp.to_i
    puts "gender of resident?"
    gender = gets.chomp
    apartments.push(Apartment.new(addy, sqft, num_beds, num_baths, Person.new(name, age, gender)))
  when "4"
    puts "What is the tenant's name?"
    tenant = gets.chomp
    puts "Age of tenant?"
    age = gets.chomp.to_i
    puts "gender of tenant?"
    gender = gets.chomp
    puts "Which apartment do you want to put the tenant?"
    count = 1
    apartments.each do |apartment|
      puts "(#{count}) #{apartment.address}"
      count += 1
    end
    choice = gets.chomp.to_i
    puts apartments[choice-1].add_renter =(Person.new(tenant, age, gender))
  when "q"
    in_operation = false
  end
end
