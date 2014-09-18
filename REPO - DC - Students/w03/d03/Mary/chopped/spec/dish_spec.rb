require 'spec_helper'

describe Dish do

  it { should have_many(:scores) }
  it { should have_many(:judges).through(:scores) }
  it { should belong_to(:chef) }
  it { should belong_to(:round) }

  it { should validate_presence_of(:title) }

end
