require 'pry'

class Tetrapod
  def leg_count
    4
  end

  def fight_or_fly
    %w(fight fly).sample
  end

end


class Person < Tetrapod # Mammal
  attr_accessor :stiff_upper_lip  
  def speak
    puts "good morning"
  end

  def talk(words_to_say)
    puts "i like saying '#{words_to_say}'"
  end
  
  def fight_or_fly
    if @stiff_upper_lip
      'steady-on, old chap'
    else
      super
    end
  end
end

class Mammal < Tetrapod
  def nipple_count
    2
  end
end

class Dog < Mammal
  def nipple_count
    8
  end
end



binding.pry
