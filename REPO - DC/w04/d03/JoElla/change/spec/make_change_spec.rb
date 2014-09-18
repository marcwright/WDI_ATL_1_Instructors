require "spec_helper.rb"
require "pry"
require_relative "../lib/make_change"


describe "make_change" do
  it "takes cents as input" do
  expect(make_change(50)).to eq(50)
  end

  it "includes quarters in the change when change is greater than 25" do
    make_change(70)
    expect(change).to include("quarter")
  end
end



#Using TDD, write a method make_change that takes a number of cents as input and in returns a combination of quarters, dimes, nickels, and pennies.

#Note: return the combination that takes the least number of coins




