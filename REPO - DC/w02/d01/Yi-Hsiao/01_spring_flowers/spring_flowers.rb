# # Spring Flowers

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
  attr_reader :type, :color

  def initialize(color="")
    @type = ""
    @color = color
    @harvest_rules = ["Break the stem"]
  end
end

class Tulip < Flower
  def initialize(color)
    super
    @type = "perennial"
  end
end

class Zinnia < Flower
  def initialize(color)
    super
    @type = "annual"
  end
end

class Rose < Flower
  def initialize(color)
    super
    @type = "perennial"
    @harvest_rules.unshift("Wear gloves")
  end
end

my_tulip = Tulip.new("red")
my_zinnia = Zinnia.new("orange")
my_rose = Rose.new("yellow")
