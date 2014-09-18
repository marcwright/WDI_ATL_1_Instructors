require "pry"

# properties = { [0] => {:address => "2012 O St", :monthly_rent => 2500, :sqft => 400, :num_beds => 1, :num_baths => 1, :renters => 1},
# [1] => {:address => "2014 N St", :monthly_rent => 2200, :sqft => 200, :num_beds => 0, :num_baths => 1, :renters => 3},
# [2] => {:address => "2016 L St", :monthly_rent => 2100, :sqft => 300, :num_beds => 1, :num_baths => 1, :renters => 1} }

apartments = []

class Renter
  def initialize
    @name = name
    @age = age
    @gender = gender
  end
end

class Apartment
  def initialize(attrs)
    @address = attrs[:address]
    @monthly_rent = attrs[:monthly_rent]
    @sqft = attrs[:sqft]
    @beds = attrs[:beds]
    @baths = attrs[:baths]
    @renters = attrs[:renters]
  end

  # define address
  def address=(address)
    @address = address
  end

  def address
    return @address
  end

  def monthly_rent=(monthly_rent)
    @monthly_rent = monthly_rent
  end

  def monthly_rent
    return @monthly_rent
  end

  def sqft=(sqft)
    @sqft = sqft
  end

  def sqft
    return @sqft
  end

  def beds=(beds)
    @beds = beds
  end

  def beds
    return @beds
  end

  def baths=(baths)
    @baths = baths
  end

  def baths
    return @baths
  end

  def renters=(renters)
    @renters = renters
  end

  def renters
    return @renters
  end

  # def all_apartments
  #   # puts apartments.each do |apt|

  # #hash to store apartment info
  # apt = {}

  # apartment_info = line.split(", ")

  #store apartment info into hash
  # apt=[:address] = apartment_info[0]
  # apt=[:monthly_rent] = apartment_info[1]
  # apt=[:sqft] = apartment_info[2]
  # apt=[:num_beds] = apartment_info[3]
  # apt=[:num_baths] = apartment_info[4]
  # apt=[:renters] = apartment_info[5]


  #user menu to choose options
  def menu
    puts "1. All Apartments\n2. View an Apartment's Details\n3. Add an Apartment\n4. Add Tenant(s)\n5. Quit"

    puts "Apartment City"
    puts "(1) View all apartments"
    puts "(2) View an apartment's details"
    puts "(3) Add an apartment"
    puts "(4) Sign an auto-e-lease"
    puts "(5) Add an apartment"
    zx
    answer = gets.chomp

    if answer == "1"
      tenant_db = File.new("tenants.txt", "a+")
        puts "Enter Address:"
        address = gets.chomp
        puts "Monthyl Rent Price:"
        monthly_rent = gets.chomp
        puts "Monthyl Rent Price:"
        monthly_rent = gets.chomp
        puts "Squarefootage:"
        sqft = gets.chomp
        puts "Bedrooms:"
        num_beds = gets.chomp
        puts "Baths:"
        num_baths = gets.chomp
        puts "Add tenant? (Y/N)"
        renters_ask = gets.chomp.downcase
        if renters_ask == "y"
          puts "How many tenants are there? 1 or 2?"
            if renters_count == "1"
              puts "Tenant name:"
              tenant0_name = gets.chomp
              puts "Age: "
              tenant0_age = gets.chomp
              puts "Gender: "
              tenant0_gender = gets.chomp

              #add single tenant to an array
              tenant_single = [tenant0_name, tenant0_age, tenant0_gender]
              f.puts
            else
              puts "Tenant 1 name:"
              tenant1_name = gets.chomp
              puts "Tenant 1 Age: "
              tenant1_age = gets.chomp
              puts "Tenant 1 Gender: "
              tenant1_gender = gets.chomp
              puts "Tenant 2 name:"
              tenant2_name = gets.chomp
              puts "Tenant 2 Age: "
              tenant2_age = gets.chomp
              puts "Tenant 2 Gender: "
              tenant2_gender = gets.chomp
            end
          else
        end
        # tenants = [species, name]
        # tenant.puts tenant.join(",")
      tenant_db.close
    elsif answer == "2"
      tenant_db = File.new("tenants.txt", "r")
        # f.each_line do |line|
        #   animal_data = line.chomp.split(",")
        #   puts "I\'m #{animal_data[1]} the #{animal_data[0]}"
        # end
      tenant_db.close
    else
    end

  end



  # Apartment details
  def details
    puts @address
    puts @monthly_rent
    puts @sqft
    puts @num_beds
    puts @num_baths
    puts @renters
  end
end

new = Apartment.new({
  address: gets.chomp,
  monthly_rent: gets,
  sqft: 450,
  num_beds: 1,
  num_baths: 1,
  renters: 1
  }
  {
  address: "3200 P St",
  monthly_rent: 1600,
  sqft: 410,
  num_beds: 0,
  num_baths: 1,
  renters: 1
  }
  {
  address: "1600 J St",
  monthly_rent: 12000,
  sqft: 1050,
  num_beds: 1,
  num_baths: 1,
  renters: 2
  })

apartments << new

binding.pry

puts new.address()
puts new.monthly_rent()
puts new.sqft()

# test = Apartment.new()
# puts test.menu
binding.pry


