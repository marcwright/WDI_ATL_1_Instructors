require "spec_helper"
require_relative "../lib/water_bottle.rb"


describe WaterBottle do

  describe "::new" do
    it "starts empty" do
      bottle = WaterBottle.new
      expect(bottle.is_empty?).to eq(0)
    end
  end

  context "filling and drinking a new water bottle" do
    bottle = WaterBottle.new

    describe "#fill a water bottle" do
      it "can be filled" do
        expect(bottle.fill).to eq(3)
      end
    end

    describe "#drink a water bottle" do
      it "can dipense" do
        expect(bottle.drink).to eq(2)
      end
    end
  end

end

