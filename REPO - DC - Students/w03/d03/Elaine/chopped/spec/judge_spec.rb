require 'spec_helper'
# require_relative '../lib/chopped.rb'

describe Judge do
  let(:judge) { Judge.new }

  it { should ensure_length_of(:name).is_at_least(2) }

  it { should ensure_length_of(:restaurant).is_at_least(2) }
end
