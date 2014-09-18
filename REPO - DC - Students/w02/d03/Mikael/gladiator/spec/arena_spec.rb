require 'spec_helper'
require_relative "../lib/arena"
require_relative "../lib/gladiator"

describe Arena do
  let(:ring) { Arena.new("hyrule") }

  describe "::new" do

    it "can be instantiated" do
      expect( ring.class ).to eq(Arena)
    end

    it "has a capitalized name" do
      expect( ring.name ).to eq("Hyrule")
    end

  end # "::new"

  describe "#add_gladiator" do
    let(:glad) { Gladiator.new("Russell", "Trident")}

    it "can have gladiators" do
      ring.gladiators << glad
      expect( ring.gladiators[-1].name ).to eq("Russell")
    end

    it "should add a new gladiator" do
      ring.add_gladiator(glad)
      expect( ring.gladiators.last.name ).to eq("Russell")
    end

    it "should have at most two gladiators" do
      ring.add_gladiator(glad)
      ring.add_gladiator(glad)
      expect( ring.add_gladiator(glad) ).to eq("This arena is full!")
    end
  end #add_gladiator

  describe "#fight" do

    it "should eliminate a gladiator based on Trident > Spear > Club" do
      glad1 = Gladiator.new("Russell", "Trident")
      glad2 = Gladiator.new("Brian", "Spear")
      ring.add_gladiator(glad1)
      ring.add_gladiator(glad2)
      ring.fight
      expect( ring.gladiators[0].name ).to eq("Russell")

    end


  end


end
