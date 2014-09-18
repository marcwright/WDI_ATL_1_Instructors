require 'spec_helper'
require_relative '../lib/energy'

describe Student do
    describe "::new" do
      let (:student) {Student.new("Salil", 0, 100)}
      it "should have a name" do
        expect(student.name).to eq("Salil")
      end

      it "should have 0 knowledge" do
        expect(student.knowledge).to eq(0)
      end

      it "should have 100 energy" do
        expect(student.energy).to eq(100)
      end
    end

    describe "#code" do

      let (:student) {Student.new("Salil", 0, 100)}
      it "should add 5 to knowledge" do
        student.code
        expect(student.knowledge).to eq(5)
      end

      it "should take away 5 from energy" do
        student.code
        expect(student.energy).to eq(95)
      end

      context "student is tired" do
        let (:student) {Student.new("Salil", 0, 45)}
        it "should add 0 to knowledge when student is tired" do
          student.code
          expect(student.knowledge).to eq(0)
        end
      end
    end

    describe "#break" do
      context "student is not tired" do
        let (:student) {Student.new("Salil", 0, 90)}
        it "should restore energy by 5" do
        student.break
        expect(student.energy).to eq(95)
      end
    end
      context "student is tired" do
        let (:student) {Student.new("Salil", 0, 45)}
        it "should restore energy to 70" do
          student.break
          expect(student.energy).to eq(70)
        end
      end
    end
end


