#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-12 13:47:18
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-12 14:21:33

class Clown < ActiveRecord::Base
  def to_s
    return "#{name}, whose talent is #{}. (S)he is #{ "not" if !is_creepy } creepy."
  end
end
