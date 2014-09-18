
class Utopia
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def self.define
    puts "I am the bodiless notion of a near-perfect society."
    return self
  end

  def define
    puts "I am #{name}, a tangible society that you can reach out and touch in which everyone is content."
    return self
  end

  def say_hello
    self.define
  end

  def say_hello_again
    define
  end
end

madison = Utopia.new("madison")
madison.say_hello_again

