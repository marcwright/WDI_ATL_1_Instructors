require 'spec_helper'
require_relative '../lib/wdi_student.rb'

describe Student do
  let(:student) { Student.new("Sam") }


  describe "::new" do
    it "should have a name" do
      expect( student.name ).to eq("Sam")
    end

    it "should have lots of energy" do
      expect( student.energy ).to eq(100)
    end

    it "should have no knowledge" do
      expect( student.knowledge ).to eq(0)
    end
  end #end new

  describe "#code" do
    it "should add knowledge" do
      student.code
      expect( student.knowledge ).to eq(5)
    end

    it "should take away energy" do
      student.code
      expect( student.energy ).to eq(95)
    end

    it "should not add knowledge with insufficient energy" do
      student.code



  end #end code

end #end student
