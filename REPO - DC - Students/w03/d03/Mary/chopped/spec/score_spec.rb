require 'spec_helper'

describe Score do

  it { should belong_to(:judge) }
  it { should belong_to(:dish) }

  it { should validate_numericality_of(:score).only_integer }
  it { should validate_numericality_of(:score).is_greater_than_or_equal_to(1) }
  it { should validate_numericality_of(:score).is_less_than_or_equal_to(5) }

end
