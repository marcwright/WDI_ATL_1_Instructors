require 'spec_helper'
require_relative '../lib/student'

describe Student do
  let ( :new_student ) { Student.new("Jordan") }

  describe "::new" do
    it "has a name" do
      expect( new_student.name ).to eq("Jordan")
    end

    it "has an energy level of 100" do
      expect( new_student.energy).to eq(100)
    end


    it "has no knowledge" do
      expect( new_student.knowledge).to eq(0)
    end
  end # new

  describe "#code" do

      it "should increase knowledge" do
        knowledge_precoding = new_student.knowledge
        new_student.code
        expect( new_student.knowledge ).to be >knowledge_precoding
      end

      it "should decrease energy" do
        energy_precoding = new_student.energy
        new_student.code
        expect( new_student.energy ).to be <energy_precoding
      end
  end

  describe "#break" do
    it "should increase energy" do
      new_student.code
      energy_prebreak = new_student.energy
      new_student.break
      expect( new_student.energy ).to be > energy_prebreak
    end

    context "when student is completely energized" do
      it "does not increase energy" do
        energy_before = new_student.energy
        new_student.break
        expect( new_student.energy ).to eq(energy_before)
      end
    end # context

    context "when student's energy is 85 or more" do
      it "increases energy to capacity (100)" do
        new_student.code
        new_student.break
        new_student.break
        expect( new_student.energy ).to eq(100)
      end
    end # context

  end

end
