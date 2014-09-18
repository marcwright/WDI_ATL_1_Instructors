require 'spec_helper'
require_relative '../lib/student'

describe Student do
  let(:new_student) {Student.new("Tom")}
  describe "::new" do

    it "has a name" do
      expect( new_student.name ).to eq("Tom")
    end

    it "has knowledge" do
      expect( new_student.knowledge ).to eq(0)
    end

    it "has an energy level" do
      expect( new_student.energy_level ).to eq(100)
    end

  end

  describe "#code" do
    context "when a student codes" do

      it "decreases a students level of energy unless already 0" do
        new_student.code
        expect( new_student.energy_level ).to eq(90)
      end

      it "increases a students knowledge unless already 100" do
        knowledge_pre_coding = new_student.knowledge
        new_student.code
        expect( new_student.knowledge ).to eq(5)
      end
    end
  end

end
