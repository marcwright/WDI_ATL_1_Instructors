require 'spec_helper'

describe Round do
  let(:round) { Round.new }

  it { should validate_presence_of(:round_name) }
  it { should have_many(:judges) }
  it { should have_many(:appearances) }
end
