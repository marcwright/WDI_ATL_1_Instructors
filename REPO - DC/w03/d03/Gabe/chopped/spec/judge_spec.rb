require 'spec_helper'

describe Judge do

  let(:judge) { Judge.new }
  it { should validate_presence_of(:id) }
  it { should validate_presence_of(:judge_name) }
  it { should belong_to(:round) }
  it { should have_many(:dishes).through(:scores) }
  it { should have_many(:scores) }
end
