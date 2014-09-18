require "pry"
require "spec_helper"
require_relative "../lib/arena"
require_relative "../lib/gladiator"

describe Arena do
  let(:arena) do
    Arena.new("colosseum",[
      Gladiator.new('Neptune', "Trident"),
      Gladiator.new("Jupiter", "Spear"),
    ])
  end

    it "should be capitalized" do
      expect(arena.name).to eq("Colosseum")
    end

  describe "#add_gladiator" do
    it "should add a gladiator to the arena" do
      gd = Gladiator.new("Maxmimus", "Trident")
      expect(arena.add_gladiator(gd)).to be_truthy
    end
  end

  describe "#fight" do
    it "should fight" do
      expect(arena.gladiators[0].name).to eq("Neptune")
    end
  end
end
