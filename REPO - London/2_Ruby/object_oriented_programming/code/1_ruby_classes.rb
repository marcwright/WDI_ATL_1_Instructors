require 'pry'

class Person

  # attr_accessor :age, :sex, :name
  # def initialize(age, sex, name)
  #   @age = age
  #   @sex = sex
  #   @name = name
  #   #@age, @sex, @name = age, sex, name
  # end


  def speak
    puts "good morning"
  end

  def talk(words_to_say)
    puts "i like saying '#{words_to_say}'"
  end


  def set_age(value)
    @age = value
  end

  def get_age
    @age
  end


end

binding.pry
