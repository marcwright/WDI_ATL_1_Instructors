require 'faker'
require 'pry'

def gen_random_address
  address = []
  address = address.push(Faker::Name.name)
  address = address.push(Faker::Address.street_address)
  address = address.push(Faker::Address.city + ", " + Faker::Address.state_abbr + " " + Faker::Address.zip_code)
  return address

end

puts gen_random_address


