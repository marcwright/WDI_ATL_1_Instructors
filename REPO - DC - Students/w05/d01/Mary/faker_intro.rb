require 'faker'

def gen_random_address
  "#{Faker::Name.name}\n#{Faker::Address.street_address}\n#{Faker::Address.city}, #{Faker::Address.state} #{Faker::Address.zip_code}"
end

puts gen_random_address
