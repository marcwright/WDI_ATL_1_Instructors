require 'spec_helper'

describe Dish do
  it { should validate_presence_of(:dish_name)}

  it { should belong_to(:round).with_foreign_key('round_id') }
  it { should belong_to(:chef).with_foreign_key('chef_id') }

  it { should have_many(:judges).through(:scores) }

  it { should validate_numericality_of(:round_id).only_integer }
  it { should validate_numericality_of(:chef_id).only_integer }
end
