require 'pry'

class Person

  age
  # @age

  # def initialize
  #   @age=6
  #   puts @age
  # end

  def get_age
    @age
  end

end

binding.pry
