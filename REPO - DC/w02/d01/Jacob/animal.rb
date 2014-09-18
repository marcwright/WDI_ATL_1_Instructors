class Animal

  attr_accessor :name
  attr_accessor :species
  attr_accessor :toys

  def initialize(name, species, toys)
    @name = name
    @species = species
    @toys = []
  end

  def new_animal(name, species, toys)
    return Animal.new(name, species, toys)
  end

  def create_animal()
  new_animal_name = answer("What is the animal's name?")
  new_animal_species = answer("What species is the animal?")
  number_of_toys = answer("How many toys (if any) does this animal have?").to_i
  if number_of_toys > 1
    new_animal_toys = []
    count = 0
    while count < number_of_toys
      toy = answer("Enter a toy here:")
      new_animal_toys.push(toy)
      count += 1
    end
  elsif number_of_toys == 1
    new_animal_toy = answer("What is the toy?")
    new_animal_toys.push(new_animal_toy)
  else
    new_animal_toys = []
  end
  new_animal = new_animal(new_animal_name, new_animal_species, new_animal_toys)
  puts "#{new_animal_name} is a #{new_animal_species} with #{number_of_toys} toys."
  binding.pry
end

end

