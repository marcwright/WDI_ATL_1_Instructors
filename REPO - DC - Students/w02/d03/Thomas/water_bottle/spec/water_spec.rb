require "spec_helper"
require_relative "../lib/water_bottle"

describe WaterBottle do
let(:bottle) {WaterBottle.new}

  it "can be instantiated" do
    expect(bottle.class).to be(WaterBottle)
  end

  it "is empty when created" do
    expect(bottle.empty?).to be_true
  end

    describe "#fill" do
      it "bottle is full when filled" do
        bottle.fill
        expect(bottle.empty?).to be_false
      end
    end

  context "when it's full" do
    before do
      bottle = WaterBottle.new
      bottle.fill
    end

    describe "#dispense" do
      it "bottle dispenses water unless it is empty" do
        bottle.dispense
        expect(bottle.empty?).to be_true
      end
    end
  end
end
