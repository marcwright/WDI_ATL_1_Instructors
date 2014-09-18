require_relative "../lib/water_bottle"
require 'spec_helper'

describe WaterBottle do
  let( :steel ){ WaterBottle.new }

  describe "::new" do
    it "initializes empty" do
      expect( steel.full? ).to be_falsey
    end
  end

  describe "#fill!" do
    it "fills it up when it is empty." do
      steel.fill!
      expect( steel.full? ).to be_truthy
    end
  end


  context "when it's full" do
      before do
        water_bottle.fill!
      end

    describe "#dispense" do
      it "dispenses the water within it" do
        expect( steel.dispense ).to eq("Water")
      end
    end
  end

  context "when empty" do
    describe "#dispense" do
      it "doesn't dispense when empty" do
        expect( steel.dispense ).to eq(false)
      end
    end
  end
end
