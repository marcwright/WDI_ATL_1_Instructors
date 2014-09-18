#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-15 15:15:36
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-15 15:18:28

class Book < ActiveRecord::Base
  belongs_to :author
  has_many :characters
end
