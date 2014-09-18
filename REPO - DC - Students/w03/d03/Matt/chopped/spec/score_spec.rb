require 'spec_helper'

describe Score do

  it { should validate_numericality_of(:score) }

  it { should validate_numericality_of(:round) }

  it { should validate_numericality_of(:judge_id) }

  it { should validate_numericality_of(:dish_id) }

end
