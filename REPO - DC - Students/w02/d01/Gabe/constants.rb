#THIS FILE CONTAINS THE SHELTER, ANIMAL AND CLIENT CLASS DEFS

#=========SHELTER CLASS====================
class Shelter
  def initialize(name)
    @name         = name
    @animals      = []
    @clients      = []
  end



  def animals #gets pets
  	return @animals
  end



  def clients #gets clients
  	return @clients
  end



  def add_animal
      @name   	 = get_answer_to("What's the animals name?")
      @species    = get_answer_to("What's the animals species?")
      @toys       = get_answer_to("How many toys does it own?")
      new_animal = Animal.new(@name, @species)
        
        @animals << new_animal #puts new pet into Shelter's array, 'pets'----
      puts "#{new_animal.name} has been added to the shelter."
  end


  def add_client
      @name   	 = get_answer_to("What's the new client's name?")
      @age   	 = get_answer_to("How old is this client?")
      new_client = Client.new(@name, @age)
        
        @clients << new_client
      puts "#{new_client.name} has joined the shelter, looking for pets."
  end


#=============2 methods for importing pre-made instances of test animals or clients


  def import_animal(animal_to_import)
    
        @animals << animal_to_import
  end
     

  def import_client(client_to_import)
      
        @clients << client_to_import
  end
      
 

    #=======method to LIST all ANIMALS in shelter
  	def list_animals
  		@animals.each_with_index do |animal, index|
    	puts "#{index + 1}) #{animal.name}."
		end
 	end


    #=======method to list all CLIENTS in sheter
	def list_clients
  		@clients.each_with_index do |client, index|
   		puts "#{index + 1}) #{client.name}."
  		end
	end

#def add_pet
 #  	if pets.size < 2
 #     		@pets << pet
 #    		puts "#{client.name} has adopted #{animal.name}."
 #  	else
 #    		puts "Our clients can only adopt two pets each."
 #  	end
 #end








end #END SHELTER CLASS



#=====CLIENT CLASS========================

class Client
  def initialize(name, age)
    @name      = name
    @age 	   = age
    @pets      = []
  end


  def name
    return @name
  end


  def age
    return @age
  end


 def pets
    return @pets
  end

  def add_pet(pet)
    if pets.size < 2
       @pets << pet
      puts "adoption complete!"
      binding.pry
    else
      puts "Our clients can only adopt two pets each."
    end
  end


  #def cat lady
    #if has_pet?
     # puts 
    #else
     # puts 
    #end
  #end

end #END CLIENT CLASS




#=====Animal CLASS========================

class Animal
  def initialize(name, species)
    @name      = name
    @species   = species
    @toys	   = []
  end

  def name
    return @name
  end



  def species
    return @species
  end
 

  def add_toy
     toys << toy
  end

end




