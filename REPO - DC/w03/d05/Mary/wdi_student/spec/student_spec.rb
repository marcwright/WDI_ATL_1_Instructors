require_relative '../lib/student'
require 'spec_helper'

describe Student do
  let (:student) { Student.new("Marsha") }

  describe "::new" do
    it "should have a name" do
      expect( student.name ).to eq("Marsha")
    end
    it "should have an amount of knowledge" do
      expect( student.knowledge ).to eq(0)
    end
    it "should have an energy level" do
      expect( student.energy ).to eq(100)
    end
  end #-- ends describe ::new

  describe "#code" do

    context ("when student codes") do
    before { student.code }
      it "should increase your knowledge" do
        expect( student.knowledge ).to eq(100)
      end
      it "should decrease your energy" do
        expect( student.energy ).to eq(50)
      end
    end #-- ends context student.codes

    it "should not increase your knowledge if you are tired to begin with" do
      student.energy = 50
      student.code
      expect( student.knowledge ).to eq(0)
    end

  end #-- ends describe #code

  describe "#take_a_break" do
    it "should increase your energy" do
      student.code
      student.take_a_break
      expect( student.energy ).to eq(100)
    end
  end #-- ends describe #take_a_break

  describe "#plan" do
    it "should allow you to code twice in a row without getting tired" do
      student.plan
      student.code
      student.code
      expect( student.energy ).to eq(100)
    end
  end #-- ends describe #plan

end #-- ends describe Student
