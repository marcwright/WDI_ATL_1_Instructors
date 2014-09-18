require "pry"

# Song
# - address
# - monthly_rent
# - sqft

apartments = []

# Instantiate a few songs to test your class.

class Tenant
  def initialize(info)
    @name = info[:name]
    @age = info[:age]
    @gender = info[:gender]
  end

  def name=(name)
    @name = name
  end

  def name
    return @name
  end

  def age=(age)
    @age = age
  end

  def age
    return @age
  end

  def gender=(gender)
    @gender = gender
  end

  def gender
    return @gender
  end
end

class Apartment
  def initialize(options)
    @address = options[:address]
    @monthly_rent = options[:monthly_rent]
    @sqft = options[:sqft]
    @num_beds = options[:num_beds]
    @num_beds = options[:num_baths]
    @tenants = options[:tenants]
  end

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

  def num_beds=(num_beds)
    @num_beds = num_beds
  end

  def num_beds
    return @num_beds
  end

  def num_baths=(num_baths)
    @num_baths = num_baths
  end

  def num_baths
    return @num_baths
  end

  def play
    return "#{self.address()} by #{self.monthly_rent()} is playing."
  end

  def stop
    # TODO: stop the music!
  end
end

puts "Address:"
address = gets.chomp
puts "Rent:"
monthly_rent = gets.chomp.to_i
puts "Sqft:"
sqft = gets.chomp.chomp.to_i
puts "Beds:"
num_beds = gets.chomp.to_i
puts "Baths:"
num_baths = gets.chomp.to_i

apartment = Apartment.new({
  address: "#{address}",
  monthly_rent: monthly_rent,
  sqft: sqft,
  num_beds: num_beds,
  num_baths: num_baths
})



apartment.address()
apartment.monthly_rent()
apartment.sqft()

binding.pry

# Playlist
# - songs
# - start (a random song starts)
# - skip (another random song is played)
# - add songs
# - remove songs
# - currently playing song

class Apartments
  def initialize
    @apartments = []
  end

  def apartments
    return @apartments
  end
end

playlist = Apartments.new
playlist.apartments(apartment)
playlist.play()

binding.pry
