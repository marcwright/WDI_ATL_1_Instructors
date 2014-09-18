require 'faker'

def gen_random_address
  name = Faker::Name.name
  address1 = Faker::Address.street_address
  address2 = Faker::Address.secondary_address
  city = Faker::Address.city
  state = Faker::Address.state_abbr
  zip = Faker::Address.zip_code
  return [ name, address1, address2, city + ", " + state+ " " + zip ]
end

puts gen_random_address
