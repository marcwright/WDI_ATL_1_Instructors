require 'pry-byebug'

module Moveable
  def walk
    puts "left, right, left, right"
  end
end

module Talkable
  def say(value)
    puts "I say: #{value}"
  end

  def shout(value)
    puts "I say: #{value}".upcase
  end
end

module Drinkable
  def drink
    puts "i can drink"
  end
end


class Person
  # include Talkable
  # include Moveable

  attr_accessor :age, :sex, :name

  def initialize(age=nil, sex=nil, name=nil)
    @age, @sex, @name = age, sex, name
    # extend Drinkable if age.to_i > 18
  end

  def whistle(tune=:aimless)
    case tune
    when :aimless
      puts "whistle whistle whistle"
    else
      puts "whistling #{tune} whistling #{tune}"
    end

  end
end

binding.pry