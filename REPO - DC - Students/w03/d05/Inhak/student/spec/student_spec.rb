require_relative '../lib/student'
require 'spec_helper'

describe Student do
  let( :student ){ Student.new("Richard") }
  describe "::new" do
    it "should show 0 knowhow unless Yi Hsiao, and have 100 energy" do
      expect( student.name ).to eq("Richard")
      expect( student.knowhow ).to eq(0)
      expect( student.energy ).to eq(100)
    end
  end

  describe "#code" do
    it "should show that the student has lower energy levels after coding." do
      student.code
      expect( student.knowhow ).to eq(5)
      expect( student.energy ).to eq(93)
    end

    it "should show that the student has energy level under 70, you can't code." do
      student.code
      student.code
      student.code
      student.code
      student.code
      expect( student.code ).to eq("Stop coding! You need a break.")
    end

    it "should not go below 65, student can't code anymore." do
      student.code
      student.code
      student.code
      student.code
      student.code
      student.code
      expect( student.energy ).to eq(65)
    end
  end

  describe "#rest" do
    it "should show an increase in energy level" do
      student.code
      student.code
      student.code
      student.rest
      expect( student.energy ).to eq(89)
    end
  end

  describe "#plan" do
    it "should "
  end

end
