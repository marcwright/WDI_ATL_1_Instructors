require "pry"

peeps = []

class Person
  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end

  attr_accessor :name
  attr_accessor :age
  attr_accessor :gender

end


peeps.push(Person.new("Jay", 30, "male"))
peeps.push(Person.new("Fred", 40, "male"))
peeps.push(Person.new("Alix", 40, "male"))
peeps.push(Person.new("Jared", 40, "male"))

def iterate(array)
puts array.each do |i|
  i.name
end
end
iterate(peeps)

binding.pry
