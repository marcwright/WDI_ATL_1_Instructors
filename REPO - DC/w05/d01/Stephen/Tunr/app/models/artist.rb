#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-19 17:57:04
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-19 18:22:35

class Artist < ActiveRecord::Base
  has_many :songs
end
