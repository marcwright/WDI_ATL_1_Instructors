require 'spec_helper'

describe Dish do
  it { should belong_to(:round) }
  it { should belong_to(:chef) }
  it { should have_many(:scores) }
  it { should have_many(:judges).through(:scores) }
  it { should validate_presence_of(:title) }
  it { should validate_numericality_of(:chef_id).only_integer }
  it { should validate_numericality_of(:round_id).only_integer }
end
