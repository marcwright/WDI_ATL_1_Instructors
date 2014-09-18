#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-09 09:58:24
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-09 10:38:15

require 'spec_helper'
require_relative '../lib/energy_management'

describe Student do
  let(:student) { Student.new }

  it { should ensure_length_of(:name).is_at_least(2) }
  it { should ensure_legnth_of(:name).is_less_than(20) }

end
