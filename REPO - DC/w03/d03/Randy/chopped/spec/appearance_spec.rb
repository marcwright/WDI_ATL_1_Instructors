require 'spec_helper'

describe Appearance do
  it { should belong_to(:judge).with_foreign_key('judge_id') }
  it { should belong_to(:episode).with_foreign_key('episode_id') }

  it { should validate_numericality_of(:judge_id).only_integer }
  it { should validate_numericality_of(:episode_id).only_integer }
end
