class Client

  attr_accessor :name
  attr_accessor :age
  attr_accessor :animals

  def initialize(name, age, animals)
    @name = name
    @age = age
    @animals = []
  end

  def add_client()
  new_client_pets = []
  new_client_name = answer("What is the client's name?")
  new_client_age = answer("What is the client's age?")
  number_of_pets = answer("How many pets (if any) does this client have?")
  if number_of_pets > "1"
    more = 'y'
    while more == 'y'
      pet = answer("Enter a toy here:")
      new_animal_toys.push(toy)
      more = answer("Are there more toys? (y/n)").downcase
    end
  elsif number_of_toys == "1"
    new_animal_toy = answer("What is the toy?")
    new_animal_toys.push(new_animal_toy)
  else
    new_animal_toys = []
  end
  @animals.push(create_animal(new_animal_name, new_animal_species, new_animal_toys))
end

end
