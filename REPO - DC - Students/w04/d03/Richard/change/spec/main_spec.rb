require 'spec_helper'
require_relative '../lib/main'



describe Change do

  describe "::new" do
    let(:change) { Change.new }
    it "creates a new class" do
    end

    it "takes a initial money value" do
      change = Change.new(3.50)
      expect( change.money ).to eq(3.50)
    end
  end

  describe "#make_change" do
    it "takes a total amount of money and returns amount of coins possible to make change" do
      change = Change.new(0.53)
      expect( change.make_change ).to eq({quarters: 2, dimes: 0, nickels: 0, pennies: 3})
    end

    it "takes more money and reduces the value" do
      change = Change.new(3.19)
      expect( change.make_change ).to eq({quarters: 12, dimes: 1, nickels: 1, pennies: 4})
    end
  end
end
