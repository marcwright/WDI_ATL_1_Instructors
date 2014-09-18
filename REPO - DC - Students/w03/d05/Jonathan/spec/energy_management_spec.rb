require 'spec_helper'
require_relative '../lib/wdi_student'

describe Student do
  describe "#name" do
    it "creates a student name" do
      name = Student.new("Jon")
      expect( student.name ).to eq (name)
    end
  end # name
end # Student class


# upon creation student knowledge start at 0

# upon creation energy starts at 100

# ensure that the knowledge level can reach 100

# ensure that the energy level can reach 100

# a student can choose to take a break

# coding increases knowledge level

# coding decreases energy level

# coding does not increase know level if energy reaches 20
