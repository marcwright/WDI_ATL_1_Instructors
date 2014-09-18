require 'spec_helper'

describe Round do

  it { should have_many(:dishes) }
  it { should have_many(:chefs).through(:dishes) }
  it { should belong_to(:episode) }

  it { should validate_numericality_of(:round_number).only_integer }
  it { should validate_numericality_of(:round_number).greater_than_or_equal_to(1) }
  it { should validate_numericality_of(:round_number).less_than_or_equal_to(3) }
end

