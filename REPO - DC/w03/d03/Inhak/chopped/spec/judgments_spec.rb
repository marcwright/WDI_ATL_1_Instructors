require 'spec_helper'

describe Judgment do
  it{should belong_to(:judge)}
  it{should belong_to(:episode)}
end
