require 'spec_helper'
# require_relative '../lib/chopped.rb'

describe Dish do
  let(:dish) { Dish.new }

  it { should ensure_length_of(:name).is_at_least(2) }
end
