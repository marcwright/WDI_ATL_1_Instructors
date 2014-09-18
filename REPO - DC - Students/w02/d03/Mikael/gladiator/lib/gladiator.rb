class Gladiator
  attr_reader :name, :weapon

  def initialize(name="", weapon="")
    @name = name
    @weapon = weapon.downcase
  end

end
