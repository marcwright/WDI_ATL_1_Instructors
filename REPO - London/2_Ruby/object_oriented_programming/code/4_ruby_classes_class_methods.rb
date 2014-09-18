require 'pry'

class Person
  @@toe_count = 10
  
  def self.toe_count=(value)
    @@toe_count=value
  end

  # different ways to access the same thing
  def self.toe_count
    @@toe_count
  end

  def Person.foot_digits
    toe_count
  end

  class << self
    def little_piggies
      toe_count
    end
  end

end

binding.pry
