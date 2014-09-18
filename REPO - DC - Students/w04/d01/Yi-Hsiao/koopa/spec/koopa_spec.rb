require "spec_helper"
require_relative "../models/koopa"

describe Koopa do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:color) }
  it { should validate_presence_of(:photo_url) }
end
