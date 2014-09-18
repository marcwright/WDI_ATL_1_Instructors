require 'spec_helper'

describe Contestant do
  it { should validate_presence_of(:name) }
  it { should have_many(:rounds).through(:dishes) }
end

describe Round do
  it { should validate_presence_of(:level) }
  it { should have_many(:dishes) }
  it { should have_many(:ingredients) }
  it { should have_many(:contestants).through(:dishes) }
end

describe Dish do
  # it { should ensure_inclusion_of(:chopped).in_array(%w(true false)) }
  it { should belong_to(:round) }
  it { should belong_to(:contestant) }

  # let(:dish) {Dish.new}
  # context "#chopped validation" do
  #   it "should be invalid for anything but true or false" do
  #     dish.chopped = "x";
  #     dish.valid?
  #     expect( clubber.errors.has_key?(:chopped) ).to eq true
  #   end
  # end
end

describe Ingredient do
  it { should belong_to(:round) }
end
