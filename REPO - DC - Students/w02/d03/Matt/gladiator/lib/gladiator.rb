require "pry"

class Gladiator
  attr_reader :name, :weapon
  attr_writer :name, :weapon

  def initialize(name, weapon)
    @name = name
    @weapon = weapon
  end

end
