require 'spec_helper'
require_relative '../lib/calc'

describe Calculator do

  describe "#add" do
    it "adds two positive numbers" do
      expect(Calculator.new.add(2, 2)).to eq(4)
    end

    it "adds a negative and positive number" do
      expect(Calculator.new.add(-1, 2)).to eq(1)
    end
  end

  describe "#subtract" do
    it "subtracts numbers" do
      expect(Calculator.new.subtract(11, 7)).to eq(4)
    end
  end

  describe "#power" do
    it "raises one positive number to the power of another positive number" do
      expect(Calculator.new.power(3, 4)).to eq(81)
    end
  end

  describe "#sum" do
    it "computes the sum of an empty array" do
      expect(Calculator.new.sum([])).to eq(0)
    end

    it "computes the sum of an array of one number"do
      expect(Calculator.new.sum([6])).to eq(6)
    end

    it "computes the sum of an array of two numbers"do
     expect(Calculator.new.sum([6, 8])).to eq(14)
    end


    it "computes the sum of an array of many numbers"do
     expect(Calculator.new.sum([2, 4, 0])).to eq(6)
    end

  end

  describe "#multiply" do
    it "multiplies two numbers"do
       expect(Calculator.new.multiply(3, 7)).to eq(21)
    end

    it "multiplies several numbers" do
     expect(Calculator.new.multiply(3, 7, 2)).to eq(42)
    end
  end

  describe "#factorial" do
    it "computes the factorial of 0"do
     expect(Calculator.new.factorial(0)).to eq(1)
    end

    it "computes the factorial of 1"do
    expect(Calculator.new.factorial(1)).to eq(1)
    end

    it "computes the factorial of 2"do
    expect(Calculator.new.factorial(2)).to eq(2)
    end

    it "computes the factorial of 5"do 
    expect(Calculator.new.factorial(5)).to eq(120)
    end
    
    it "computes the factorial of 10"do
    expect(Calculator.new.factorial(10)).to eq(3628800)
    end
  end

end