require 'spec_helper'
require 'pry'
require_relative '../lib/main'

describe Bottle do
  it "can be instantiated" do
    bottle = Bottle.new
    expect(bottle.class).to be(Bottle)
  end

  describe "#empty"
    it "is empty" do
      bottle = Bottle.new
      expect( bottle.empty ).to be_true
    end
  end

  describe "#fill!"
    it "can be filled" do
      bottle = Bottle.new
      bottle.fill!
      expect( bottle.empty ).to be_false
    end
  end

  describe "#dispense"
    context "when it's full" do
      let(:bottle) { Bottle.new }
        before do
          bottle.fill!
        end
      it "can dispense unless empty" do
        expect( bottle.dispense ).to eq("Water")
      end
    end # context - when full

    context "when empty" do
      it "can't dispense water" do
        bottle = Bottle.new
        expect(bottle.dispense).to eq(false)
      end
    end # context - when empty
  end



      # it "is empty after dispensing water" do
      #   bottle = Bottle.new
      #   bottle.fill!
      #   bottle.dispense
      #   expect( bottle.empty ).to be_true
      # end

end
