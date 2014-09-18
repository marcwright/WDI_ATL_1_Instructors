#==========================
#Defining the Shelter Class
#==========================

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
