require 'spec_helper'
require_relative '../lib/make_change'


describe Changer do
  let(:changer) {Changer.new(118)}

  describe "::new" do

    it "should take an argument upon creation and set that argument to the instance variable 'coins'" do
      expect(changer.coins).to eq(118)
    end


  end #End desc new

  describe "#make_change" do
    context "When something other than a number is input as a parameter" do
      it "should return an error when a non-number is entered as an argument" do
        changer = Changer.new("Banana")
        expect(changer.make_change).to eq("Please enter a number!")
      end
    end #End Context

    context "When a proper vlue (number) is entered as a parameter" do
      it "should return the total number of quarters available from your coins" do
        changer.make_change
        expect(changer.change[:quarters]).to eq(4)
      end

      it "should return the total number of dimes available from your coins" do
        changer.make_change
        expect(changer.change[:dimes]).to eq(1)
      end

      it "should return the total number of nickles available from your coins" do
        changer.make_change
        expect(changer.change[:nickles]).to eq(1)
      end

      it "should return the total number of pennies available from your coins" do
        changer.make_change
        expect(changer.change[:pennies]).to eq(3)
      end
    end #end Context

  end #End desc #make_change










end #End desc Changer
