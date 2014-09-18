class Animal
  def initialize(animal_name, species, toys)
    @animal_name = animal_name
    @species = species
    @toys = toys
  end

  def add_animal(animal_array)
    animal_name = add("What is the animal's name?")
    species = add("What species is the animal?")
    toys = add("What toys does the animal have?")
    new_animal = Animal.new(animal_name, species, toys)
    animal_array << new_animal
    puts ""
    puts "You added #{new_animal.name}"
  end

  def animal_name
    return @animal_name
  end

  def animal_name=(animal_name)
    @animal_name = animal_name
    returns @animal_name
  end

  def species
    return @species
  end

  def species=(species)
    @species = species
    returns @species
  end

  def toys
    return @toys
  end

  def toys=(toys)
    @toys = toys
    returns @toys
  end
end
