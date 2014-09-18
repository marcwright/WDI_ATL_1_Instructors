class Shelter
  def initialize(name)
    @name = name
    @clients = []
    @animals = []
  end

  def name
    return @name
  end

  def clients
    @clients.each do |client|
      return client.print_client
    end
  end

  def animals
    @animals.each do |animal|
      return animal.print_animal
    end
  end

  def add_animal
    name = get_answer_to("What is the animal's name?")
    species = get_answer_to("What is the animal's species?")
    new_animal = Animal.new(name,species)
    new_animal_sentence = new_animal.print_animal
    @animals.push(new_animal_sentence)
    return @animals
  end

  def add_client
    name = get_answer_to("What is the client's name?")
    age = get_answer_to("What is the client's age?")
    new_client = Client.new(name,age)
    @clients.push(new_client)
    @clients.each do |client|
      client.print_client
    end
  end

  def facilitate_adoption
    new_or_not = get_answer_to("Is this a new or existing client?")
    if new_or_not == "new"
      name = get_answer_to("What is the client's name?")
      age = get_answer_to("What is the client's age?")
      new_client = Client.new(name,age)
      new_client_sentence = new_client.print_client
      @clients.push(new_client_sentence)
      puts @animals
      puts "Which animal would you like to adopt from the above list?"
      animal_to_adopt = gets.chomp
      @animals.delete(animal_to_adopt)
      new_client.adopt_pet(animal_to_adopt)
    else
      puts "Which client is this?"
      @clients.each do |client|
        puts ((clients.index(client)) + 1).to_s + ". " + client
      end
      client_choice = gets.chomp
      existing_client = clients[client_choice.to_i - 1]
      puts @animals
      puts "Which animal would you like to adopt from the above list?"
      animal_to_adopt = gets.chomp
      @animals.delete(animal_to_adopt)
      existing_client.adopt_pet(animal_to_adopt)
    end
  end

  def facilitate_put_up_for_adoption
    name = get_answer_to("What is the new client's name?")
    age = get_answer_to("What is the client's age?")
    new_client = Client.new(name,age)
    new_client_sentence = new_client.print_client
    @clients.push(new_client_sentence)

    name = get_answer_to("What is the animal's name that you would like to put up for adoption?")
    species = get_answer_to("What is that animal's species?")
    new_animal = Animal.new(name,species)
    new_animal_sentence = new_animal.print_animal
    @animals.push(new_animal_sentence)
  end
end
