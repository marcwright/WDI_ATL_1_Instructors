require 'spec_helper'

describe Dish do
  let(:dish) { Dish.new }

  it { should validate_presence_of(:description) }

end
