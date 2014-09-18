require 'spec_helper'

describe Dish do

  it { should validate_presence_of(:item) }

  it { should validate_numericality_of(:chef_id) }

end
