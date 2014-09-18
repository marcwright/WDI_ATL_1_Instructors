require 'spec_helper'

describe Chef do

  it { should have_many(:dishes) }
  it { should have_many(:rounds).through(:dishes) }
  it { should belong_to(:episode) }

  it { should validate_presence_of(:name) }

end
