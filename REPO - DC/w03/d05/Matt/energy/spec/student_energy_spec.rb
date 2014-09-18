require 'spec_helper'
require 'pry'
require_relative '../lib/student_energy'


describe Student do

  let(:student) {Student.new("R Kelly")}

  describe "::new" do

    it "can be instantiated" do
      student
      expect(student.class).to be(Student)
    end

    it "should have no knowledge" do
      student
      expect(student.brain).to eq(0)
    end

    it "should have full enery" do
      student
      expect(student.energy).to eq(100)
    end

  end

  describe "#code" do

    it "should get more brain when it codes" do
      student
      student.code
      expect(student.brain).to eq(1)
    end

    it "should have less energy when it codes" do
      student
      student.code
      expect(student.energy).to eq(99)
    end

  end

  describe "#break" do
    student.code
    energy_pre = student.energy
    student.break
    expect( student.energy ).to_be > energy_pre
  end



end
