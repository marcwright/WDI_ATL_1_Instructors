require 'spec_helper'

describe Score do
  it { should belong_to(:judge) }
  it { should belong_to(:dish) }
end
