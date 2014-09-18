require 'spec_helper'
# require_relative '../lib/chopped.rb'

describe Chef do
  let(:chef) { Chef.new }

  it { should ensure_length_of(:name).is_at_least(2) }

  it { should ensure_length_of(:hometown).is_at_least(2) }

  it { should ensure_length_of(:restaurant).is_at_least(2) }
end
