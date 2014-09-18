require 'spec_helper'

describe Round do
  it {should validate_presence_of(:name)}
  it {should ensure_inclusion_of(:name).in_array(%w(appetizer entree dessert))}

  it {should have_many(:dishes)}
  it {should have_many(:chefs).through(:dishes)}
end
