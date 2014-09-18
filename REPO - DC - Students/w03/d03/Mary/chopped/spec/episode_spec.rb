require 'spec_helper'

describe Episode do

  it { should have_many(:rounds) }
  it { should have_many(:chefs) }

  it { should validate_presence_of(:episode_name) }

  it { should validate_numericality_of(:season_number).only_integer }

  it { should validate_numericality_of(:episode_number).only_integer }

end
