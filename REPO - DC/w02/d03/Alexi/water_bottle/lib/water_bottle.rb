require 'pry'

class WaterBottle
  def initialize
    @empty = true
  end

end

def is_empty?
  @is_empty = true
end

def fill
  @empty = false
end

def dispense
  if is_empty?
    return false
  else
    return "Water"
end
