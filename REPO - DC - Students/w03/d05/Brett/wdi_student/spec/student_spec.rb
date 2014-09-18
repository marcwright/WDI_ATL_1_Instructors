require 'spec_helper'
require_relative '../lib/student'

describe Student do
  let(:student) { Student.new "Brett" }

  describe "::new" do
    it "has a name" do
      expect(student.name).to eq "Brett"
    end
    it "has 0 knowledge" do
      expect(student.knowledge).to eq(0)
    end
    it "has 100 energy (full)" do
      expect(student.energy).to eq(100)
    end
  end

  describe "#code" do

    it "should increase the amount of knowledge by 10 points" do
      student.code
      expect(student.knowledge).to eq(10)
    end
    it "should decrease the student's energy level by 10 points" do
      student.code
      expect(student.energy).to eq(90)
    end

    context "if the student is tired (less than or equal to 50 energy)" do
      before do
        student.code
        student.code
        student.code
        student.code
        student.code
        student.code
      end

      it "should prevent knowledge from increasing when student is tired" do
        expect(student.knowledge).to eq(50)
      end
      it "should still drain the student's energy" do
        expect(student.energy).to eq(40)
      end
    end
  end

  describe "#break" do

    it "restores the energy level to 100" do
      student.code
      student.break
      expect(student.energy).to eq(100)
    end
  end

  describe "#plan" do

    it "allows you to code twice before draining energy" do
      student.plan
      student.code
      student.code
      expect(student.energy).to eq(90)
    end
  end
end
