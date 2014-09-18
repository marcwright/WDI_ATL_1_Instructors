require 'spec_helper'

describe Score do
  it{should belong_to(:dish)}
  it{should belong_to(:judge)}
end
