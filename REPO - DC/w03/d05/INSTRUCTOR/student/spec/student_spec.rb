require 'spec_helper'
require_relative '../lib/student.rb'

describe Student do
  let(:new_student) { Student.new("Mikael") }
  describe "::new" do
    it "has a name" do
      expect(new_student.name).to eq("Mikael")
    end

    it "has an energy level of 100" do
      expect(new_student.energy).to eq(100)
    end

    it "has no knowledge" do
      expect(new_student.knowledge).to eq(0)
    end
  end

  describe "#code" do
    context "when student has more than 40 energy" do
      it "increases knowledge" do
        knowledge_pre_coding = new_student.knowledge
        new_student.code
        expect(new_student.knowledge).to be > knowledge_pre_coding
      end

      it "decreases energy" do
        energy_pre_coding = new_student.energy
        new_student.code
        expect(new_student.energy).to be < energy_pre_coding
      end
    end

    context "student has energy below 40" do
      it "does not increase knowledge" do
        new_student.code
        new_student.code
        new_student.code
        knowledge_before = new_student.knowledge
        new_student.code
        expect(new_student.knowledge).to eq(knowledge_before)
      end
    end

    context "when student energy is less than 25" do
      it "takes their energy down to zero" do
        new_student.code
        new_student.code
        new_student.break
        new_student.code
        new_student.code
        energy_before = new_student.energy
        new_student.code
        expect(new_student.energy).to eq(0)
      end
    end
  end

  describe "#break" do
    it "increases energy" do
      new_student.code
      energy_pre = new_student.energy
      new_student.break
      expect(new_student.energy).to be > energy_pre
    end

    context "when the student is completely energized" do
      it "does not increase energy" do
        energy_before = new_student.energy
        new_student.break
        expect(new_student.energy).to eq(energy_before)
      end
    end

    context "when a students energy is 85 or more" do
      it "increases energy to capacity (100)" do
        new_student.code
        new_student.break
        new_student.break
        expect(new_student.energy).to eq(100)
      end
    end
  end
end
