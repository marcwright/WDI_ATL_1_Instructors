require 'spec_helper'
require_relative '../lib/water_bottle'

describe WaterBottle do

  describe "::new" do

    context "Creating a new Water Bottle" do
      it "starts empty when it is created" do
        bottle = WaterBottle.new
        expect( bottle.empty? ).to be_true
      end

      it "starts with three sips when it is created" do
        bottle = WaterBottle.new
        expect( bottle.sips? ).to eq(0)
      end
    end
  end

  describe "#fill" do
    context "filling the water bottle" do
      let( :bottle ) { WaterBottle.new }
      it "can be filled up with water" do
        bottle.fill!
        expect( bottle.empty? ).to be_false
      end

      it "has three sips after being filled" do
        bottle.fill!
        expect( bottle.sips? ).to eq(3)
      end
    end
  end


  describe "#dispense" do
    context "when it's full" do
    let( :bottle ) { WaterBottle.new }
    before do
      bottle.fill!
    end

    it "can dispense water" do
      bottle.dispense!
      expect( bottle.empty? ).to be_true
    end

    it "removes one sip from the bottle" do
      bottle.dispense!
      expect( bottle.sips? ).to eq(2)
    end
  end

  context "when empty" do
    let( :bottle ) { WaterBottle.new }
    it "doesn't dispense water" do
      bottle.dispense!
      expect( bottle.dispense!  ).to eq("Water bottle is empty. Can't dispense.")
    end
  end
end
end
