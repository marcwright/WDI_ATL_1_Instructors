class Arena
  attr_reader :name, :gladiators
  attr_writer :name, :gladiators

  def initialize(name)
    @name = name.capitalize
    @gladiators = []
  end

  def add_gladiator(gladiator)
    if gladiators.length < 2
      gladiators.push(gladiator)
    end
  end

  def call_fight
    if gladiators.length == 2
      gladiators.push(gladiator)
    end
  end

end
