require 'spec_helper'
require_relative "../lib/wdi_student"

describe Student do
  let(:student){Student.new("Jake")}

  describe "::new" do
    it "should have a name" do
      expect(student.name).to eq("Jake")
    end
    it "should have a knowledge level of 0" do
      expect(student.knowledge).to eq(0)
    end
    it "should have an energy level of 100" do
      expect(student.energy).to eq(100)
    end
  end

  describe "#code" do
    context "when student has more than 40 energy" do
      it "should increase knowledge" do
        knowledge_precoding = student.knowledge
        student.code
        expect(student.knowledge).to be > knowledge_precoding
      end
    end

    it "decreases energy" do
      energy_precoding = student.energy
      student.code
      expect(student.energy).to be < energy_precoding
    end

    context "student has energy below 40" do
      it "shouldn't increase knowledge" do
        student.code
        student.code
        student.code
        knowledge_precoding = student.knowledge
        student.code
        expect(student.knowledge).to eq(knowledge_precoding)
      end
    end

    context "when student energy is less than 25" do
      it "takes their energy down to zero" do
        student.code
        student.code
        student.break
        student.code
        student.code

      end
  end

  describe "#take_break" do
    it "should increase energy" do
      student.code
      energy_precoding = student.energy
      student.break
      expect(student.energy).to be > energy_precoding
    end

    context "when the student is completely energized" do
      it "should not increase energy" do
        energy_before = student.energy
        student.break
        expect(student.energy).to eq(energy_before)
      end

    end

    context "when a student's energy is 85 or more" do
      it "should increase energy to 100" do
        student.code
        student.break
        student.break
        expect(student.energy).to eq(100)
      end
    end
  end

end#describe Student
