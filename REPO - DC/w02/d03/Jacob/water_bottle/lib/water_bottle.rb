# class WaterBottle

#   def initialize
#     @empty = true
#   end

#   def empty?
#     return @empty
#   end

#   def fill
#     @empty = false
#   end

#   def dispense_to_two_thirds
#     if empty?
#       return false
#     else
#       @level = 2/3
#     end
#   end

#   def level?
#     return @level
#   end

#   def dispense_to_one_third
#     if level? == 2/3
#       return @level = 1/3
#     end
#   end

# end

Travis Answer

class WaterBottle
  def initialize
    @empty = true
  end

  def is_empty?
    @empty
  end

  def fill
    @empty = false
  end

  def dispense
    if is_empty?
      return false
    else
      @empty = true
      return "Water"
  end
end
