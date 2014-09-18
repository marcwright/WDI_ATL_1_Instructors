# Spring Flowers

# It's springtime! Let's grow some flowers… Complete this exercise in a new files called `spring_flowers.rb`:

# 1. Define an abstract **Flower** class with the following:
# 	* type = getter method specifying 'annual' / 'perennial'
# 	* color = getter method specifying your pick of color keywords.
# 	* harvest_rules = provides instructions on how to pick the flower.
# 2. Create the following flowers:
# 	* Tulip (perennial)
# 	* Zinnia (annual)
# 	* Rose (perennial)
# 3. Customize the `harvest_rules` instructions…
# 	* All flowers should specify "Break the stem" by default.
# 	* A rose should instruct us to wear gloves!


class Flower
  attr_accessor :type, :color

  def initialize
    @type = 'perennial'
    @color = 'red'
  end

  def which_type?
    return "The flower type is #{@type}"
    return self
  end

  def which_color?
    return "The flower color is #{@color}"
    return self
  end

  def how_to_pick
    return "Break the Stem"
  end
end

class Tulip < Flower
  def initialize
    super
    @color = 'purple'
  end
end


class Zinnia < Flower
  def initialize
    super
    @type = 'annual'
    @color = 'yellow'
  end
end

class Rose < Flower
  def initialize
    super
    @color = 'red'
  end

  def how_to_pick
    puts "Where gloves! Break Stem! Profit!"
  end
end

tulip = Tulip.new
zinnia = Zinnia.new
rose = Rose.new

tulip.which_type?.which_color?.how_to_pick
tulip.which_color?
tulip.how_to_pick

zinnia.which_type?
zinnia.which_color?
zinnia.how_to_pick

rose.which_type?
rose.which_color?
rose.how_to_pick

