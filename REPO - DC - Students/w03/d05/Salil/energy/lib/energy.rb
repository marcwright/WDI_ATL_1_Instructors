# require 'pry'


class Student
  attr_accessor :name, :knowledge, :energy

  def initialize(name, knowledge, energy)
    @name = name
    @knowledge = knowledge
    @energy = energy
  end

  def code
    if @energy <= 50
      @energy -= 5
    else
      @knowledge += 5
      @energy -= 5
    end
  end

  def break
    if @energy <= 50
      @energy = 70
    else
      @energy += 5
    end
  end


end
