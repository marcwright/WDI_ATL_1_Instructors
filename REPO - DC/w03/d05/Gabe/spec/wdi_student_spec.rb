require 'spec_helper'
require 'wdi_student'

describe Student do
  before :each do
    @student = Student.new "Gabe"
  end

  describe "#name" do
    it "all students return a name" do
        @student.name.should eql "Gabe"
    end
  end

  describe "#energy" do
    it "a new student returns an energy level (out of 100)" do
        @student.energy.should eql(100)
    end
  end

  describe "#knowledge" do
    it "a new student returns a knowledge level (out of 100)" do
        @student.knowledge.should eql(0)
    end
  end


 #describe "#type_code" do
 #    it "coding increases your knowledge;" do
 #      student = Student.new
 #       student.type_code
 #        expect(student.knowledge).should eql(5)
 #    end
 #  end
 #end

end #Student





  #describe "#type_code" do
  #  it "coding diminishes your energy!" do
  #    student.type_code
  #      expect {student.energy}.should eql(75)
  #  end
  #end
#
  #describe "#take_break" do
  #  it "a new student returns an energy level (out of 100)" do
  #      @student.energy.should eql(100)
  #  end
  #end



#
#  describe "#author" do
#    it "returns the correct author" do
#        @book.author.should eql "Author"
#    end
#  end
#
#  describe "#category" do
#    it "returns the correct category" do
#        @book.category.should eql :category
#    end
#end

