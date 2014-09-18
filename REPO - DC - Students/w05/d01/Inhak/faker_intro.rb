require 'faker'

def gen_random_address
  fake_address = "
    #{Faker::Address.street_address}
    #{Faker::Address.city}
    #{Faker::Address.state}
    #{Faker::Address.zip_code}"
end

puts gen_random_address
puts gen_random_address
puts gen_random_address
