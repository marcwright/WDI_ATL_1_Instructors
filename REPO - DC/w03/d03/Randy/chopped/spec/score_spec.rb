require 'spec_helper'

describe Score do
  it { should validate_numericality_of(:score_value).only_integer }

  it { should belong_to(:judge).with_foreign_key('judge_id') }
  it { should belong_to(:dish).with_foreign_key('dish_id') }

  it { should validate_numericality_of(:judge_id).only_integer }
  it { should validate_numericality_of(:dish_id).only_integer }
end
