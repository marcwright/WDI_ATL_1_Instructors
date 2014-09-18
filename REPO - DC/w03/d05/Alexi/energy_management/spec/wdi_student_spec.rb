require 'spec_helper'
require_relative '../lib/wdi_student'


describe Student do
  let(:student) { Student.new("Alexi") }
  describe "::new" do
      it "has a name" do
      expect( new_student.name ).to eq( 'Alexi' )
    end
  end
  
  it "has an energy level of 100" do
      expect( new_student.energy).to eq( 100 )
  end
  
  it "has no knowledge" do
    epect( new_student.knowledge ).to eq( 0 )
  end
  
end # END STUDENT CLASS
