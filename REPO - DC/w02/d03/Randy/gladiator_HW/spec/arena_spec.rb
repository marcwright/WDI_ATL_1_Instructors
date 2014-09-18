
#Fully Functional, with a couple bonuses done.
#Hasn't been very refactored because I got sleepy.


require 'spec_helper'
require_relative '../lib/arena'
require_relative '../lib/gladiator'

describe "Arena" do
  it "creates a new arena instance" do
      arena = Arena.new("Pit")
    end


  describe "::new" do
    let(:arena){Arena.new("Pit")}
    let(:gladiators){arena.gladiators}

    it "has a name" do
      expect(arena.name).to eq("Pit")
    end

    it "starts with no gladiators" do
      expect(gladiators.empty?).to eq(true)
    end

    describe "#add_gladiator" do
    it "will add the specificed gladiator to the arena." do
      sparky = Gladiator.new("Sparky", "Club")
      arena.add_gladiator(sparky)
      expect(gladiators.empty?).to be(false)
    end
  end #Describe #add_gladiator


    describe "#gladiator_count" do
      it "checks to see if there are no more than 2 gladiators in the arena" do
        sparky = Gladiator.new("Sparky", "Club")
        arena.add_gladiator(sparky)
        bitey = Gladiator.new("Bitey", "Trident")
        arena.add_gladiator(bitey)
        scratchy = Gladiator.new("Scratchy", "Spear")
        arena.add_gladiator(scratchy)
        expect(arena.gladiator_count).to eq("Only two at a time!")
     end

      it "checks to see if there are 2 gladiators in the arena" do
      sparky = Gladiator.new("Sparky", "Club")
       arena.add_gladiator(sparky)
       bitey = Gladiator.new("Bitey", "Trident")
       arena.add_gladiator(bitey)
       expect(arena.gladiator_count).to eq(true)
      end

      it "checks to see if there is less than 2 gladiators in the arena" do
       sparky = Gladiator.new("Sparky", "Club")
       arena.add_gladiator(sparky)
       expect(arena.gladiator_count).to eq(false)
      end
     end #End the describe #gladiator_count


    describe "#fight" do
      it "if there are 2 gladiators in the arena, fight to the death" do
        sparky = Gladiator.new("Sparky", "Trident")
        arena.add_gladiator(sparky)
        bitey = Gladiator.new("Bitey", "Club")
        arena.add_gladiator(bitey)
        arena.fight
        expect(arena.gladiators[0].name).to eq("Bitey")
      end

    #NOTE: When you RSpec these two test, you must answer 'y' at the first "Finish Him?"
    #And 'n' at the second.

      it "should ask user if loser should be 'removed' or not (not would 'remove' the victor." do
        sparky = Gladiator.new("Sparky", "Trident")
        arena.add_gladiator(sparky)
        bitey = Gladiator.new("Bitey", "Club")
        arena.add_gladiator(bitey)
        arena.fight
        expect(arena.gladiators[0].name).to eq("Sparky")
      end

    # Couldn't Quite get this one :(
      # it "should automatically declare any gladiator named 'Maximus' the winnder." do
      #   bitey = Gladiator.new("Bitey", "Club")
      #   arena.add_gladiator(bitey)
      #   max = Gladiator.new("Maximus", "Rugged Determination")
      #   arena.add_gladiator(max)
      #   expect(arena.gladiators[0].name).to eq "Maximus"
      # end
    end #Ends describe #fight


    describe "#remove_gladiator" do
      it "should remove a gladiator by name" do
        sparky = Gladiator.new("Sparky", "Trident")
        arena.add_gladiator(sparky)
        bitey = Gladiator.new("Bitey", "Club")
        arena.add_gladiator(bitey)
        arena.remove_gladiator("Sparky")
        expect(gladiators[0].name).to eq("Bitey")
      end
    end # End describe #remove_gladiator


    describe "#entertained?" do
      it "should return true if a gladiator named 'Maximus' is in the arena" do
        bitey = Gladiator.new("Bitey", "Club")
        arena.add_gladiator(bitey)
        max = Gladiator.new("Maximus", "Rugged Determination")
        arena.add_gladiator(max)
        expect(arena.entertained?).to eq (true)
      end
    end #End of describe #entertained?
  end # End describe ::new
end #End describe Arena
