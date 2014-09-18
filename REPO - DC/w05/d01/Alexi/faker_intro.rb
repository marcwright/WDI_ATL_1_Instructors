require "pry"
require "faker"


def gen_random_address
  city    = Faker::Address.city
  street  = Faker::Address.street_name
  zip     = Faker::Address.zip
  puts city
  binding.pry
end
