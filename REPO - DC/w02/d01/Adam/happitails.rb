#==========================
#Defining the Animal Class
#==========================

class Animal
  def initialize(name, species, toys)
    @name = ''
    @species = ''
    @toys = []
  end

  def name
    return @name
  end

  def name=(name)
    @name = name
    return @name
  end

  def species
    return @species
  end

  def species=(species)
    @species = species
    return @species
  end

  def toys
    return @toys
  end

  def toys=(toys)
    @toys = toys
    return @toys
  end
end

#==========================
#Defining the Client Class
#==========================

class Client
  def initialize(name, age, animals)
    @name = ''
    @age = ''
    @animals = []
  end

  def name
    return @name
  end

  def name=(name)
    @name = name
    return @name
  end

  def age
    return @age
  end

  def age=(age)
    @age = age
    return @age
  end

  def animals
    return @animals
  end

  def animals=(animals)
    @animals = animals
    return @animals
  end
end

#==========================
#Defining the Shelter Class
#==========================

class Shelter
  def initialize(name, animals, clients)
    @name = ''
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

  def animals
    return @animals
  end

  def animals=(animals)
    @animals = animals
    return @animals
  end

  def clients
    return @cleints
  end

  def clients=(clients)
    @clients = clients
    return @clients
  end
end
