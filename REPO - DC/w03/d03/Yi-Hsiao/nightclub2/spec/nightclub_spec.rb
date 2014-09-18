require "spec_helper"
require_relative '../lib/nightclub'

describe Clubber do
  let(:clubber) { Clubber.new }

  it { ensure_length_of(:name).is_at_least(2) }

  # context "#name validation" do
#   #   it "should be invalid with fewer than two letters" do
#   #     clubber.name = 'T';
#   #     clubber.valid?
#   #     expect( clubber.errors.has_key?(:name) ).to eq true
#   #   end

#   #   it "should be valid with two or more letters" do
#   #     clubber.name = 'TJ';
#   #     clubber.valid?
#   #     expect( clubber.errors.has_key?(:name) ).to eq false
#   #   end
#   # end

  it { should validate_numericality_of(:age).is_greater_than_or_equal_to(21) }
  it { should validate_numericality_of(:age).is_less_than(60) }

#   # context "#age validation" do
#   #   it "should be invalid when under 21" do
#   #     clubber.age = 20;
#   #     clubber.valid?
#   #     expect( clubber.errors.has_key?(:age) ).to eq true
#   #   end

#   #   it "should be invalid when age is 60 or above" do
#   #     clubber.age = 60;
#   #     clubber.valid?
#   #     expect( clubber.errors.has_key?(:age) ).to eq true
#   #   end

#   #   it "should be valid when age is between 21 and 60" do
#   #     clubber.age = 21;
#   #     clubber.valid?
#   #     expect( clubber.errors.has_key?(:age) ).to eq false
#   #   end
#   # end

  it { should ensure_inclusion_of(:gender).in_array(%w(m f)) }

#   # context "#gender validation" do
#   #   it "should be invalid for anything but 'm' or 'f'" do
#   #     clubber.gender = "x";
#   #     clubber.valid?
#   #     expect( clubber.errors.has_key?(:gender) ).to eq true
#   #   end

#   #   it "should be valid for value 'm'" do
#   #     clubber.gender = "m";
#   #     clubber.valid?
#   #     expect( clubber.errors.has_key?(:gender) ).to eq false
#   #   end

#   #   it "should be valid for value 'f'" do
#   #     clubber.gender = "f";
#   #     clubber.valid?
#   #     expect( clubber.errors.has_key?(:gender) ).to eq false
#   #   end
#   # end

#   # context "#gender_ratio validation" do
#   #   before {
#   #     clubber.name = "Leslie"
#   #     clubber.age = 21
#   #   }

#   #   after {
#   #     Clubber.destroy_all()
#   #   }

#   #   it "should always be valid for females" do
#   #     clubber.gender = "f"
#   #     clubber.valid?
#   #     expect( clubber.errors.has_key?(:gender_ratio) ).to eq false
#   #   end

#   #   it "should be invalid for males when ratio is below 2:1" do
#   #     clubber.gender = "m"
#   #     clubber.valid?
#   #     expect( clubber.errors.has_key?(:gender_ratio) ).to eq true
#   #   end

#   #   it "should be valid for males when ratio is at least 2:1" do
#   #     Clubber.create(name: "Sally", age: 21, gender: 'f')
#   #     clubber.gender = "m"
#   #     clubber.valid?
#   #     expect( clubber.errors.has_key?(:gender_ratio) ).to eq false
#   #   end
#   # end

#   # context "#format_gender" do
#   #   it "should return 'female' when gender is 'f'" do
#   #     clubber.gender = "f"
#   #     expect( clubber.format_gender ).to eq "female"
#   #   end

#   #   it "should return 'male' when gender is 'm'" do
#   #     clubber.gender = "m"
#   #     expect( clubber.format_gender ).to eq "male"
#   #   end
#   # end
end

$connection.disconnect!
