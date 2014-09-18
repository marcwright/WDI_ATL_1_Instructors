require "spec_helper"
# require_relative ""

class Light

  def initialize
    @on = false
  end

  def on?
    return @on
  end

  def flip!
    @on = !on?
  end

  # def light
  #   return @light
  # end
end
