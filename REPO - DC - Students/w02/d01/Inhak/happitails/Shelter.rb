require 'pry'

require_relative "Animal.rb"
require_relative "Client.rb"

class Shelter
  def initialize (name)
    @name = name
    @animals = []
    @clients = []
  end

  def add_animal(name, species)
    @animals.push(Animal.new(name, species))
  end

  def add_client(name, age)
    @clients.push(Client.new(name, age))
  end

  def return_clients
    puts "the clients are:"
    count = 1
    @clients.each do |client|
      puts "(#{count}) #{client.name}"
      count += 1
    end
  end

  def return_animals
    puts "the animals are:"
    count = 1
    @animals.each do |animal|
      puts "(#{count}) #{animal.name}"
      count += 1
    end
  end

  def adopt
    puts "Which client is adopting?(NUMBER ANSWER)"
    self.return_clients
    adopter = gets.chomp.to_i
    puts "Which animal is being adopted? (NUMBER ANSWER)"
    puts self.return_animals
    pet = gets.chomp.to_i
    @clients[adopter - 1].add_pet(@animals[pet-1])
    @animals.delete(@animals[pet-1])
  end

  def unadopt
    puts "Which client is returning their pet? (NUMBER ANSWER)"
    self.return_clients
    adopter = gets.chomp.to_i
    puts "Which animal is s/he returning? (NUMBER ANSWER)"
    puts "#{@clients[adopter-1].show_off_pets}"
    pet = gets.chomp.to_i
    @animals.push(@clients[adopter-1].index_pet(pet-1))
    @clients[adopter-1].remove_pet_index(pet-1)
  end
end


