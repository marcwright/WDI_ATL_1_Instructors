class Client
  def initialize(client_name, age, pets)
    @client_name = client_name
    @age = age
    @pets = pets
  end

  def client_name
    return @client_name
  end

  def client_name=(client_name)
    @client_name = client_name
    returns @client_name
  end

  def age
    return @age
  end

  def age=(age)
    @age = age
    returns @age
  end

  def pets
    return @pets
  end

  def pets=(pets)
    @pets = pets
    returns @pets
  end

  # def pets=(pets)
  #   @pets = pets
  #   returns @pets
  # end
end
