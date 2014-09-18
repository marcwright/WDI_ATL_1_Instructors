#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-15 15:15:44
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-15 15:20:30

class Character < ActiveRecord::Base
  belongs_to :book
end
