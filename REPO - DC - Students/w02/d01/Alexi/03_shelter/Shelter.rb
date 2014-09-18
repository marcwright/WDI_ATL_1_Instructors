
# CLASS
class Shelter
  def initialize(name)
    @name             = name
    @animals          = []
    @clients          = []
  end

  # Menu option to add animals
  def add_animal
    species           = get_answer_to("What is the species?")
    name              = get_answer_to("What is the animal\'s name?")
    animal            = Animals.new(name, species)
    @animals         << animal
  end

  # Menu option to add client
  def add_client
    name              = get_answer_to("What is the client\'s name?")
    age               = get_answer_to("What is the client\'s age?")
    new_client        = Clients.new(name, age)
    @clients         << new_client
  end

  # Instantiated methods for new animals and clients
  def add_initial_animal(animal)
    @animals.push(animal)
  end
  
  def add_initial_client(client)
    @clients.push(client)
  end

  # Menu option to display animals
  def disp_animals
    @animals.each do |animal|
      puts "Name: #{animal.name}"
      puts "Species: #{animal.species}"
    end
  end

  # Menu option to display clients
  def disp_clients
    @clients.each do |client|
      puts "Name: #{client.name}"
      puts "Age: #{client.age}"
    end
  end

  # Menu option to adopt
  def adopt_pet
    puts " "
    puts "Which client is adopting a pet?"
    @clients.each do |client|
      puts "Name: #{client.name}"
      adopting_client = gets.chomp.downcase
    end  
      when adopting_client = true
        client_index = @clients(adopting_client).index
      end
    puts " "
    puts "Type the name of the pet being adopted?"
    @animals.each do |animal|
      puts " "
      puts "Name: #{animal.name}"
      puts "Species: #{animal.species}"
    end
    desired_pet = gets.chomp.downcase
      when desired_pet = true
        pet_index = @animals(desired_pet).index
      end
  end

# DELETE ME
# a = %w( ant bat cat dog )
# a.delete_at(2)    #=> "cat"
# a                 #=> ["ant", "bat", "dog"]
# a.delete_at(99)   #=> nil

# a = [ "a", "b", "c" ]
# a.index("b")        #=> 1
# a.index("z")        #=> nil
# a.index{|x|x=="b"}  #=> 1
# DELETE ME




  # Getter and Setter for 'name'
  def name=(name)
    @name = name
    return @name
  end
  def name
    return @name
  end

  # setter for 'animals'
  def animals
    return @animals
  end

  # setter for 'clients'
  def clients
    return @clients
  end
end
