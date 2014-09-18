require 'spec_helper'
require_relative '../lib/change'

describe Change do
  describe "::new" do
    let( :moneys ){ Change.new(337) }
    it "should take the cents and return the number of cents" do
      expect( moneys.cents ).to eq(337)
    end
  end

  describe "#make_change" do
    it "should convert the change into proper denominations" do
      moneys = Change.new(300)
      expect( moneys.make_change ).to eq({quarters: 12, dimes: 0, nickels: 0, pennies: 0})
    end

    it "should convert any amount of cents" do
      moneys = Change.new(139)
      expect( moneys.make_change ).to eq({quarters: 5, dimes: 1, nickels: 0, pennies: 4})
    end

    it "shouldn't take bad values" do
      moneys = Change.new("poopie")
      expect( moneys.make_change ).to eq("Not a valid input")
    end
  end
end
