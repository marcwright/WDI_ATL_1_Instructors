require 'spec_helper'

describe Judgment do
  it { should have_many(:judges) }
  it { should have_many(:episodes) }
  it { should belong_to(:judge) }
  it { should belong_to(:episode) }
end
