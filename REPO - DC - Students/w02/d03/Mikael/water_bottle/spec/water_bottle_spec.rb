require 'spec_helper'
require_relative "../lib/water_bottle"

describe WaterBottle do
  let(:bottle) { WaterBottle.new }

  it "can be instantiated" do
    expect(bottle.class).to be(WaterBottle)
  end

  describe "a newly instantiated bottle" do
    it "is empty" do
      expect( bottle.is_empty? ).to be_truthy
    end

   end #describe - a newly instantiated bottle

  describe "#fill" do

    it "can be filled if it is empty" do
      bottle.fill
      expect( bottle.is_empty? ).to be_falsey
    end

    it "can dispense water if it is full" do
      bottle.fill
      bottle.dispense
      expect( bottle.is_empty? ).to be_truthy
    end

  end #describe - fill




  describe "#sip" do
    context "when the bottle is empty" do
      before(:each) do
          bottle.dispense
        end

      it "tells you if the bottle is empty" do
        expect( bottle.sip ).to eq("Fill the bottle up!")
      end
    end

    context "when the bottle has water" do
      before(:each) do
        bottle.fill
      end

      it "decreases the amount of sips by 1" do
        bottle.sip
        bottle.sip
        bottle.sip
        expect( bottle.is_empty? ).to be_truthy
      end

    end



  end

end #describe WaterBottle
