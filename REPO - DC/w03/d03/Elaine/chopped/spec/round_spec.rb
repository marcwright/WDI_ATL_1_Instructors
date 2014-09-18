require 'spec_helper'
# require_relative '../lib/chopped.rb'

describe Round do
  let(:round) { Round.new }

  it { should ensure_inclusion_of(:course).in_array(%w(appetizer entree dessert)) }
end
