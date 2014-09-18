#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-19 18:03:52
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-19 18:09:12

class Song < ActiveRecord::Base
  belongs_to :artist
end
