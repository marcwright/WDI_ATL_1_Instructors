require_relative "Animal.rb"

class Client
  def initialize (name, age)
    @name = name
    @age = age
    @pets = []
  end

  def name
    return @name
  end

  def add_pet(pet)
    @pets.push(pet)
  end

  def remove_pet_index(num)
    @pets.delete_at(num)
  end

  def show_off_pets
    count = 1
    @pets.each do |pet|
      puts "(#{count}) #{pet.name}"
      count += 1
    end
  end

  def index_pet(num)
    return @pets[num]
  end
end
