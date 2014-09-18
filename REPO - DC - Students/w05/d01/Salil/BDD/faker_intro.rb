require 'faker'

I18n.enforce_available_locales = false

def gen_random_address
  puts Faker::Name.name
  puts Faker::Address.street_address
  puts Faker::Address.secondary_address
  print Faker::Address.city + ","
  print " " + Faker::Address.state_abbr
  puts " " +Faker::Address.postcode
end


gen_random_address
