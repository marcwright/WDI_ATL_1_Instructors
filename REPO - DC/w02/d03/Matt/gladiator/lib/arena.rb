require "pry"
require_relative "gladiator"

class Arena
  attr_reader :arena_name, :gladiators, :beats
  attr_writer :arena_name, :gladiators, :beats

  def initialize(arena_name)
    @arena_name = arena_name.capitalize
    @gladiators = []
    @beats = {}
  end

  def add_gladiator(gladiator)
    if gladiators.count >= 2
      return false
    end
    @gladiators.push(gladiator)
    # if there are already 2 gladiators
  end

  def winner?
      return true
    else
      return false
    end
  end

  def battle
    beats = { "Trident" => "Spear", "Spear" => "Club", "Club" => "Trident" }

    if gladiators.size == 2
      if gladiators.first.weapon == gladiators.last.weapon
        gladiators.clear
      elsif beats[gladiators.first.weapon] == gladiators.last.weapon
        gladiators.delete_at(1)
      else
        gladiators.delete_at(0)
      end
    end
  end

  binding.pry

  # Go...!

  # def name
  #   @quantity -= 1
  # end

