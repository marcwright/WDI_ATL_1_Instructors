class Flower

  private

  def initialize(color)
    @type = type
    @color = color
    puts @how_to_pick = "Break the stem."
  end

  def type
    return @type
  end

  def color
    return @color
  end
end

class Rose < Flower

  private

  def initialize(color)
    @type = "perennial"
    super
    puts @how_to_pick +=" Wear gloves!"
  end

public

  def harvest_rules
    super
    puts "Wear gloves!"
  end
end

class Zinnia < Flower

  private

  def initialize(color)
    @type = "annual"
    super
  end
end

class Tulip < Flower

  private

  def initialize(color)
    @type = "perennial"
    super
  end
end

flower_1 = Tulip.new("yellow")
flower_2 = Zinnia.new("blue")
flower_3 = Rose.new("red")
