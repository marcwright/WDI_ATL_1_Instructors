#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-19 09:58:08
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-19 10:20:14

require 'faker'
I18n.enforce_available_locales = false

def gen_random_address
  return Faker::Name.name + "\n" +
         Faker::Address.street_address + "\n" +
         Faker::Address.secondary_address + "\n" +
         Faker::Address.city + ", " + Faker::Address.state_abbr + " " + Faker::Address.zip_code + "\n\n"
end

5.times do
  puts gen_random_address
end
