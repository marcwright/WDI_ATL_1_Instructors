require 'spec_helper'

describe Round do
  it { should belong_to(:episode) }
  it { should have_many(:dishes) }
  it { should have_many(:chefs).through(:dishes) }
  it { should validate_numericality_of(:episode_id).only_integer }
  it { should validate_numericality_of(:round_number).is_greater_than_or_equal_to(1) }
  it { should validate_numericality_of(:round_number).is_less_than(4) }
end
