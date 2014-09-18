

def gets_input(prompt)
  puts prompt
  answer = gets.chomp
  return answer
end

class Shelter

  attr_accessor :name
  attr_accessor :animals
  attr_accessor :clients

  def initialize(name)
    @name = name
    @animals = []
    @clients = []
  end

  def add_animal(animal)
    @animals.push(animal)
  end

  def add_client(client)
    @clients.push(client)
  end

  def disp_animals
    @animals.each do |animal|
      puts "#{animal.name} the #{animal.species}"
    end
  end

  def disp_clients
    @clients.each_with_index do |client, index|
      puts client.name
    end
  end

  def choose_client
    @clients.each_with_index do |client, index|
      puts "Press #{index} for #{client.name}"
    end
    client_index = gets.to_i
    return @clients[client_index]
  end

  def adopt_animal
    @animals.each_with_index do |animal, index|
      puts "Press #{index} for #{animal.name} the #{animal.species}"
    end
    animal_index = gets.to_i
    puts "\nYou adopted #{@animals[animal_index].name} the #{@animals[animal_index].species}! :D"
    puts ""
    adopted = @animals[animal_index]
    @animals.delete_at(animal_index)
    return adopted
  end

  def return_animal

  end

end
