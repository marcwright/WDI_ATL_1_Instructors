class Arena
  attr_accessor :name, :gladiators, :status, :ring

  def initialize(name, gladiators=[])
    @name = name.split(" ").each { |word| word.capitalize!}.join(" ")
    @gladiators = gladiators
    @status = ""
    @ring = []
  end

  def add_gladiator
    if @ring.count < 2
      @ring.push(@gladiators.sample)
    else
      @status = "That's too many"
    end
  end

  def fight
    if @ring.count < 2
      return "I can't fight myself"
    elsif @ring.count == 2
      if @ring[0].weapon == @ring[1].weapon
        @ring.clear
        elsif
          @ring[0].weapon == "trident" && @ring[1].weapon == "spear"
          @ring.delete_at(1)
        elsif
          @ring[0].weapon == "spear" && @ring[1].weapon == "club"
          @ring.delete_at(1)
        elsif
          @ring[0].weapon == "club" && @ring[1].weapon == "trident"
          @ring.delete_at(0)
          elsif
          @ring[1].weapon == "trident" && @ring[0].weapon == "spear"
          @ring.delete_at(0)
        elsif
          @ring[1].weapon == "spear" && @ring[0].weapon == "club"
          @ring.delete_at(0)
        elsif
          @ring[1].weapon == "club" && @ring[0].weapon == "trident"
          @ring.delete_at(1)
      end
    end
  end


# Trident beats Spear
# Spear beats Club
# Club beats Trident

end
