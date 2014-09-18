class Person < Mammal
  include Talkable
  include Moveable

  @@toe_count = 10

  attr_accessor :age
  attr_reader :parent1
  attr_writer :parent2

  def initialize(options={})
    @age = options[:age]
    @parent1 = options[:parent1]
    @parent2 = options[:parent2]
    super
  end

  def self.breed(person1, person2)
    Person.new :parent1 => person1, :parent2 =>person2
  end

end