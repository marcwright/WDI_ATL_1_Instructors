

def gets_input(prompt)
  puts prompt
  answer = gets.chomp
  return answer
end

class Client

  attr_accessor :name
  attr_accessor :age
  attr_accessor :pets

  def initialize(name,age)
    @name = name
    @age = age
    @pets = []
  end

  def add_pets(pet)
    @pets.push(pet)
  end

end
