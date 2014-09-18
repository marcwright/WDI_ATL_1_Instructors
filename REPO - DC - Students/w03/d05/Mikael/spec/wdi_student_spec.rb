require_relative 'spec_helper'
require_relative '../lib/wdi_student'

describe WDIStudent do
  let(:mike) { WDIStudent.new("Mikael Davis")}
  describe "::new" do
    it "starts with a name" do
      expect(mike.name).to eq("Mikael Davis")
    end

    it "starts with no knowledge" do
      expect( mike.knowledge ).to eq(0)
    end

    it "starts with full energy" do
      expect(mike.energy).to eq(100)
    end
  end # ::new

  describe "#tired?" do
    it "returns true when the student is tired" do
      mike.code
      mike.code
      expect(mike.tired?).to be_true
    end
  end

  describe "#code" do
    context "when the student has enough energy" do
      it "decreases energy by 50" do
        mike.code
        expect(mike.energy).to eq(50)
      end

      it "increases knowledge by 30" do
        mike.code
        expect(mike.knowledge).to eq(30)
      end
    end # context

    context "when the student does not have enough energy" do
      before(:each) { mike.energy = 50 }

      it "does not increase knowledge" do
        mike.code
        expect(mike.knowledge).to eq(0)
      end
    end # context
  end # code

  describe "#take_break" do
    it "restores energy" do
      mike.code
      mike.take_break
      expect(mike.energy).to eq(100)
    end
  end

  describe "#plan" do

  end
end
