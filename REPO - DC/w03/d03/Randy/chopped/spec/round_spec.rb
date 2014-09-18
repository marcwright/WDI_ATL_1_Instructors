require 'spec_helper'

describe Round do
  it { should validate_numericality_of(:round_num).only_integer }
  it { should have_many(:scores).through(:dishes) }
  it { should belong_to(:episode).with_foreign_key('episode_id') }

  it { should validate_numericality_of(:episode_id).only_integer }
end
