require "pry"
require_relative 'constants.rb'

shelter_1 = Shelter.new("Mega-Shelter")
client_1 = Client.new("Joe Blow", 27)
animal_1 = Animal.new("Poppy", "Dog")

# move client and animal into shelter 1 ==>

shelter_1.import_client client_1
shelter_1.import_animal animal_1 

# <== we might here try and make shelter_1 a global variable, $shelter_1
#shelter_1 = $shelter_1

# binding.pry