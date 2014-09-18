require 'spec_helper'

describe Dish do
  let(:dish) { Dish.new }

  it { should validate_presence_of(:id) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:which_chef) }
  it { should belong_to(:chef) }
   it { should have_many(:scores) }
  it { should have_many(:judges).through(:scores) }

end
