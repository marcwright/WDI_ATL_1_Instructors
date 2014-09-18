require 'pry'
require 'faker'


def gen_random_address
  puts Faker::Name.name
  puts Faker::Address.street_address
  puts Faker::Address.city_prefix print + "," + Faker::Address.state_abbr

end

gen_random_address()
