require 'spec_helper'
require_relative '../lib/wdi_student'

describe Student do
  describe "::new" do
  let(:student) {Student.new("Randy")}

    it "should start with a name" do
      expect(student.name).to eq("Randy")
    end

    it "should start with 0 knowledge" do
      expect(student.knowledge).to eq(0)
    end

    it "should start with 100 energy" do
      expect(student.energy).to eq(100)
    end
  end# End of desc ::new

  describe "#is_tired?" do

    it "should return true if student energy < 50" do
      student = Student.new("Bob")
      student.energy = 45
      expect(student.is_tired?).to be_truthy
    end

    it "should return false if student energy > 50" do
      student = Student.new("Bob")
      student.energy = 76
      expect(student.is_tired?).to be_falsey
    end

  end #End desc #is_tired

  describe "#code" do
    it "should add 10 to knowledge if student is not tired." do
      student = Student.new("Bob")
      student.knowledge = 65
      student.energy = 76
      student.code
      expect(student.knowledge).to eq(75)
    end

    it "should tell the student theya re too tired to learn if they are tired" do
      student = Student.new("Bob")
      student.knowledge = 65
      student.energy = 36
      expect(student.code).to eq("You are too tired to learn!")
    end

    it "should take away 20 energy every time" do
      student = Student.new("Bob")
      student.knowledge = 65
      student.energy = 76
      student.code
      expect(student.energy).to eq(56)
    end
  end #End Desc Code

  describe "#break" do
    it "should restore energy to 100" do
      student = Student.new("Bob")
      student.energy = 76
      student.break
      expect(student.energy).to eq(100)
    end
  end #End Desc Break

  describe "#plan" do
    it "should allow for the code method to be run twice without energy dropping below 50" do
      student = Student.new("Bob")
      student.energy = 76
      student.plan
      student.code
      student.code
      expect(student.energy).to be > 50
    end

  end #end desc #plan


end #End desc Student
