require 'pry'
require 'spec_helper'
require_relative '../lib/water_bottle.rb'

describe WaterBottle do
  
  	context "#initialize?" do
    	it "a water bottle exists" do
      bottle = WaterBottle.new
      expect(bottle).to be_true
    end
  end

	context "#is_empty?" do
    	it "a water bottle is created empty" do
      bottle = WaterBottle.new
      bottle.is_empty?
      expect(bottle.is_empty?).to be_true
    end
   end
 
 	context "#fill!" do
    	it "a water bottle can be filled" do
      bottle = WaterBottle.new
      bottle.fill
      expect(bottle.is_empty?).to be_false
    end
   end

   context "#fill!" do
    	it "a full water bottle cannot be filled; it overflows" do
      bottle = WaterBottle.new
      bottle.is_empty?
      bottle.fill
      expect(bottle.fill).to be_false
    end
   end

   context "#drink!" do
    	it "One can take a drink from a full bottle" do
      bottle = WaterBottle.new
      bottle.is_empty?
      bottle.fill
      expect(bottle.drink).to be_true
    end
   end

    context "#drink!" do
    	it "One cannot take a drink from an empty bottle" do
      bottle = WaterBottle.new
      bottle.is_empty?
      expect(bottle.drink).to be_false
    end
   end

context "#drink!" do
    	it "One can drink up to 3 'drinks' from a bottle--then it becomes empty" do
      bottle = WaterBottle.new
      bottle.is_empty?
      bottle.fill
      bottle.drink
      bottle.drink!
      bottle.drink!
      expect(bottle.is_empty?).to be_true
    end
   end



end
