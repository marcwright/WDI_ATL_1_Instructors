#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-15 15:15:20
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-15 15:20:19

class Author < ActiveRecord::Base
  has_many :books
  has_many :characters, through: :books
end
