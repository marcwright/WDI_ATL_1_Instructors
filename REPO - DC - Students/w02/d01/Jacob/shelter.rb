class Shelter

  attr_accessor :name
  attr_accessor :animals
  attr_accessor :clients

  def initialize(name, animals, clients)
    @name = name
    @animals = []
    @clients = []
  end

end


