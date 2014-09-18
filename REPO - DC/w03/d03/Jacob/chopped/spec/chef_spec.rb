require 'spec_helper'

describe Chef do
  it { should belong_to(:episode) }
  it { should have_many(:dishes) }
  it { should have_many(:rounds).through(:dishes) }
  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:episode_id).only_integer }
end
