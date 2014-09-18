class Shelter
  def initialize(name)
    @name = name
    @animals = []
    @clients = []
  end

  def name
    return @name
  end

  def name=(name)
    @name = name
    return @name
  end

  def display_animals
      return @animals
  end

  def display_clients
      return @clients
  end

  def add_initial_animal(animal)
      @animals.push(animal)
  end

  def add_initial_client(client)
      @clients.push(client)
  end

  #for use when user adds an animal
  def add_animal
    name = get_answer_to("What's its name?")
    species = get_answer_to("What species is #{name}")
    new_animal = Animal.new(name, species)
    @animals << new_animal
    puts ""
    puts "Great. You've added #{new_animal.name} to your collection of animals."
  end

  #for use when user adds a new client
  def add_client
    name = get_answer_to("What is the client's name?")
    age = get_answer_to("How old is the client")
    new_client = Client.new(name, age)
    @clients << new_client
    puts ""
    puts "Great. You've added #{new_client.name} to your client list."
  end

  def display_all_animals
      puts "We have:"
    @animals.each do |animal|
      puts "#{animal.name} the #{animal.species}"
    end
  end

  def display_all_clients
      puts "Our clients include:"
    @clients.each do |client|
      puts "#{client.name}"
    end
  end

  def select_client
      puts "Select your name by ENTERING its position integer"
      @clients.each_with_index do |client, index|
      puts "#{client.name} at position #{index}"
    end
      user_answer = gets.to_i
      puts "Hello #{@clients[user_answer].name}"
      return @clients[user_answer]
  end

  def select_animal
      puts "Select an animal to adopt by ENTERING its position integer, we have:"
      puts "\n"
    @animals.each_with_index do |animal, index|
      puts "#{animal.name} the #{animal.species} at position #{index}"
    end
      user_choice = gets.to_i
      puts "you have selected #{@animals[user_choice].name} the #{@animals[user_choice].species}"
      return @animals[user_choice]
  end
end
