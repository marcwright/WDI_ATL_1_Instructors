

class Person

  def initialize(personal_options)
    @name = personal_options[:name]
    @age = personal_options[:age]
    @gender = personal_options[:gender]
  end
end
  
 class Apartment
    attr_reader :address
    attr_reader :monthly_rent
    attr_reader :sqft
    attr_reader :num_beds
    attr_reader :num_baths
    attr_reader :renters
    #attr_accessor :apartment_listings

  def initialize(options)
  	@address = options[:address]
  	@monthly_rent = options[:monthly_rent]
  	@sqft = options[:sqft]
  	@num_beds = options[:num_beds]
  	@num_baths = options[:num_baths]
  	@renters = options[:renters]
    #@apartment_listings = []

  end

  public

  def list_apartments
    puts @address
  end

  def list_details
  end

  def add_apartment
  end

  def add_tenant
  end

end

first_street_apartment = Apartment.new({
	address: "101 First Street", 
	monthly_rent: "1000", 
	sqft: "700", num_beds: "1", 
	num_baths: "1", 
	renters: "1"
})

second_street_apartment = Apartment.new({
	address: "202 Second Street", 
	monthly_rent: "1200", 
	sqft: "900", 
	num_beds: "1", 
	num_baths: "1", 
	renters: "1"
})

third_street_apartment = Apartment.new({
	address: "303 Third Street", 
	monthly_rent: "1700", 
	sqft: "2000", 
	num_beds: "2", 
	num_baths: "2", 
	renters: "2"
})



options = ["1. List all apartments", "2. View apartment details", "3. Add an apartment", "4. Add a tenant", "5. Quit"]

  while true
  puts "Hello user, please select a number to perform the associated task:"
  puts "\n"
  puts options
  answer = gets.chomp

  if answer == "1"
    puts "\n"
    puts "My Real Estate:"
    puts first_street_apartment.list_apartments, second_street_apartment.list_apartments, third_street_apartment.list_apartments
    puts "presss enter to continue or 5 to quit."
    answer = gets.chomp

  end

  break if answer == "5"
end
