require 'spec_helper'

describe Judge do
  it{should validate_presence_of(:name)}
  it{should validate_presence_of(:age)}
  it{should validate_presence_of(:gender)}
  it{should have_many(:scores)}
  it{should have_many(:episodes)}
  it{should have_many(:judgments)}
end
