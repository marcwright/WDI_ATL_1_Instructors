require 'pry'

class Animal

  def initialize(animal_name, species)
    @name = animal_name
    @species = species
    @toys = []
  end

  def name
    return @name
  end

  def species
    return @species
  end

  def toys
    return @toys
  end

# def adopt_animal(name)
#     @animals.delete(name)
#     puts "#{name} was adopted!"
#   end

#   def return_animal(name)
#     @animals.push(name)
#     puts "#{name} was returned!"
#   end

end

# animal_1 = Animal.new("Max", "dog", "ducky")
# puts animal_1.name
