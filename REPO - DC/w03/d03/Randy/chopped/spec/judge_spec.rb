require 'spec_helper'

describe Judge do
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:fav_food)}
  it { should validate_numericality_of(:age).only_integer }

  it { should have_many(:appearances) }
  it { should have_many(:scores) }
end
