require "spec_helper"
require_relative "../lib/play"

describe "#add" do
  it "adds two positive numbers together" do
    expect( add(2,3) ).to eq(5)
  end

  it "adds two negative numbers together" do
    expect( add(-2, -4) ).to( eq(-6) )
  end
end

describe("#odds") do
  it("selects odd numbers") do
    expect( odds([1,2,3]) ).to eq( [1,3] )
  end

  it "can select from an array with no odds" do
    expect( odds([2,4,6]) ).to eq( [] )
  end

  it "can select from an array with no elements" do
    expect( odds([]) ).to eq( [] )
  end
end


describe "#palindrome?" do
  it "is a palindrome" do
    expect( palindrome?("racecar") ).to be_true
  end

  it "isn't a palindrome" do
    expect( palindrome?("jeff") ).to eq(false)
  end

  it "isn't a palindrome if there is one character" do
    expect( palindrome?("a") ).to be_false
  end

  it "is a palindrome if some characters are uppercased" do
    expect( palindrome?("aBbA") ).to be_true
  end

  it "is a palindrome if there are spaces at the end" do
    expect( palindrome?("abba ") ).to be_true
  end
end