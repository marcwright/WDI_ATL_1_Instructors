#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-12 15:43:56
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-12 18:59:49

class Koopa < ActiveRecord::Base
  def to_s
    return "#{name} is #{color} and #{has_shell ? "has a shell" : "does not have a shell"}!"
  end
end
