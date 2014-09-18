require "spec_helper"
require_relative '../lib/water_bottle'

describe WaterBottle do
  it "can be instantiated" do
  water_bottle = WaterBottle.new
  expect(water_bottle.class).to be(WaterBottle)
  end

  describe "A newly instantiated water bottle" do
      let(:water_bottle){ WaterBottle.new}
      it "Starts off empty" do
        expect(water_bottle.empty?).to be(true)
      end

    context "when" do
      before do
        water_bottle.fill!
      end

        it "can be be filled" do
          expect(water_bottle.empty?).to eq(false)
        end

        it "can dispense water if it is not empty" do
          expect(water_bottle.pour!).to eq("Pour away!")
        end
      end #Ends context block

      it "is empty once it has been poured" do
        water_bottle.pour!
        expect(water_bottle.empty?).to be(true)
      end
  end
end
