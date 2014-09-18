require 'spec_helper'

describe Score do
  it { should belong_to(:dish) }
  it { should belong_to(:judge) }
  it { should validate_numericality_of(:numerical_score).is_greater_than_or_equal_to(1) }
  it { should validate_numericality_of(:numerical_score).is_less_than(6) }
  it { should validate_numericality_of(:dish_id).only_integer }
  it { should validate_numericality_of(:judge_id).only_integer }
end
