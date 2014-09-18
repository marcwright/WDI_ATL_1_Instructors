require "faker"

def generate_fake_contact
faker_address = Faker::Address
  
  contact = {}

  contact[:name] = Faker::Name.name
  contact[:address_1] = "#{ faker_address.street_address } #{ faker_address.street_suffix }"
  contact[:address_2] = faker_address.secondary_address if rand(2) == 1
  contact[:address_3] = "#{ faker_address.city }, #{ faker_address.state_abbr } #{ faker_address.zip_code }"

  return contact
end

def print_contact(contact)
  puts contact[:name]
  puts contact[:address_1]
  puts contact[:address_2] if contact.has_key? :address_2
  puts contact[:address_3]
end

print_contact generate_fake_contact