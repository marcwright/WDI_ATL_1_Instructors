require 'spec_helper'

describe Score do
    let(:score) { Score.new }

  it { should validate_presence_of(:dish_score) }
  it { should validate_numericality_of(:dish_score).only_integer }
  it { should belong_to(:dish) }
  it { should belong_to(:judge) }
  it { should belong_to(:chef) }
end
