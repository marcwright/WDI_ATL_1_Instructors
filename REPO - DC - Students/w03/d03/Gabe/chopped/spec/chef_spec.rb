require 'spec_helper'

describe Chef do
  let(:chef) { Chef.new }

  it { should validate_presence_of(:chef_name) }
  it { should belong_to(:round) }
  it { should have_many(:dishes) }
  it { should have_many(:scores).through(:dishes) }
end
