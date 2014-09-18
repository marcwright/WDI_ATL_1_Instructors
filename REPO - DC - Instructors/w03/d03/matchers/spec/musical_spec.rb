require 'spec_helper'
require_relative '../lib/musical'

describe Musical do
   it { should validate_presence_of(:composer) }
end