# Stephen Stanwood (stephen@stanwoodsolutions.com)

require 'pry'

class Person

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end

  # Returns the tenant's name
  def name
    return @name
  end

end

class Apartment

  def initialize(attrs)
    @address = attrs[:address]
    @monthy_rent = attrs[:monthy_rent]
    @sqft = attrs[:sqft]
    @num_beds = attrs[:num_beds]
    @num_baths = attrs[:num_baths]
    @renters = []
  end

  # Returns the address of the apartment
  def address
    return @address
  end

  # Indicates whether an apartment is currently occupied
  def occupied?
    return @renters.size != 0
  end

  # Adds a tenant to the apartment (or not, if full)
  def add(tenant)
    return false if @renters.size >= @num_beds
    @renters << tenant.name
  end

  # Removes a tenant from the apartment, returns the new apartment
  def remove(tenant)
    @renters.delete(tenant)
  end

  # Converts the information about the apartment to a legible string
  def to_s
    if occupied?
      return @renters.join(" and ") + " live(s) in #{@address}"
    else
      res = "#{@address} is #{@sqft} sqft and has #{@num_beds} bed(s) "
      res += "and #{@num_baths} bath(s). It costs $#{@monthy_rent} a month."
      return res
    end
  end

end

# Displays a header for the Landlord program
def disp_header
  puts "==================================================================="
  puts "=============== Welcome to ApartmentTrackr! ======================="
  puts "==================================================================="
  puts "=> MENU OPTIONS: (l)ist, (v)iew, +(a)pt, +(t)en, (e)vict, (q)uit =="
  puts "==================================================================="
end

# Prompts a user for an option until they provide a valid one, then returns
def prompt(spec, options)
  while true
    print "#{spec} (#{options.join(', ')}): "
    response = gets.chomp
    return response if options.include? response
  end
end

# Allows the user to add another apartment
def add_apartment
  attrs = {}
  puts "Adding apartment..."
  print "==> Address? "
  attrs[:address] = gets.chomp
  print "==> Monthly rent? "
  attrs[:monthy_rent] = gets.chomp.to_i
  print "==> Sq. feet? "
  attrs[:sqft] = gets.chomp.to_i
  print "==> How many beds? "
  attrs[:num_beds] = gets.chomp.to_i
  print "==> How many bathrooms? "
  attrs[:num_baths] = gets.chomp.to_i
  return Apartment.new(attrs)
end

# Allows the user to add a tenant to a specified apartment
def add_tenant(apts)
  puts "Adding tenant..."
  print "==> Name? "
  name = gets.chomp
  print "==> Age? "
  age = gets.chomp.to_i
  print "==> Gender? "
  gender = gets.chomp
  dest_addr = prompt("==> to which apartment?", apts.map { |a| a.address })
  dest_index = apts.find_index { |a| a.address == dest_addr }

  # Add the new tenant, printing an error if the add fails
  if !apts[dest_index].add(Person.new(name, age, gender))
    puts "Can't add -- full apartment!"
  end
end

# Allows the user to evict a specified tenant
def evict_tenant(apts)
  print "Evict whom? "
  to_evict = gets.chomp
  apts.each { |a| a.remove(to_evict) if a != nil }
end

disp_header
apts = []

apts << Apartment.new( {
      :address => "1A",
      :monthy_rent => 1000,
      :sqft => 800,
      :num_beds => 1,
      :num_baths => 1 })

apts << Apartment.new( {
      :address => "1B",
      :monthy_rent => 1200,
      :sqft => 900,
      :num_beds => 2,
      :num_baths => 1 })

apts << Apartment.new( {
      :address => "2A",
      :monthy_rent => 800,
      :sqft => 600,
      :num_beds => 0,
      :num_baths => 1 })

apts << Apartment.new( {
      :address => "2B",
      :monthy_rent => 2000,
      :sqft => 1600,
      :num_beds => 2,
      :num_baths => 2 })

# Loop performing commands until the user wants to quit
while true
  resp = prompt("Pick an option", ['l', 'v', 'a', 't', 'e', 'q'])
  break if resp == 'q'
  case resp
  # View all apartments' details
  when 'l'
    apts.each { |a| puts a }
  # View an apartment's details
  when 'v'
    to_view = prompt("==> Pick an apartment", apts.map { |a| a.address })
    puts (apts.select { |a| a.address == to_view }).first
  # Add an apartment
  when 'a'
    apts << add_apartment
  when 'e'
    evict_tenant(apts)
  # Add a tenant to an apartment
  when 't'
    add_tenant(apts)
  end
  puts
end

puts "Thanks for using ApartmentTrackr!"
