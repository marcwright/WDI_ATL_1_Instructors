require 'spec_helper'
require 'pry'
require_relative '../lib/water_bottle'

describe WaterBottle do
  it "can be instantiated" do
    bottle = WaterBottle.new
    expect( bottle.class).to be(WaterBottle)
  end

  describe "a newly instantiated bottle" do

    let(:bottle) { WaterBottle.new }

    it "starts off empty with cap on" do
      expect( bottle.is_empty ).to be_truthy
      expect( bottle.cap_on ).to be_truthy
    end # - starts of empty with cap on

    describe "#twist_cap!" do

      it "opens the bottle" do
        bottle.twist_cap!
        expect( bottle.cap_on ).to be_falsey
      end # = opens the bottle

      it "closes the bottle" do
        bottle.twist_cap!
        bottle.twist_cap!
        expect( bottle.cap_on ).to be_truthy
      end # closes the bottle
    end

    describe "#fill_bottle" do

      it "fills bottle if bottle is empty and cap is off" do
        bottle.twist_cap!
        expect( bottle.is_empty ).to be_truthy
        expect( bottle.cap_on ).to be_falsey
        bottle.fill_bottle!
        expect( bottle.is_empty ).to be_falsey
      end
    end

    describe "#dispense_liquid" do
      it "empties the bottle if bottle is full and cap is off" do
        bottle.twist_cap!
        expect( bottle.cap_on ).to be_falsey
        bottle.fill_bottle!
        expect( bottle.is_empty ).to be_falsey
        bottle.dispense_liquid
        expect( bottle.is_empty ).to be_truthy
      end
    end

  end
end
