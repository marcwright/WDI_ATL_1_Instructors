require 'spec_helper'

describe Judge do
  it { should have_many(:scores) }
  it { should have_many(:dishes).through(:scores) }
  it { should validate_presence_of(:name) }
end
