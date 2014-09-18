#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-12 15:43:56
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-12 16:01:13

class Coaster < ActiveRecord::Base
  def to_s
    return "#{name} has a top speed of #{top_speed}.  You have to be #{min_height} inches tall to ride!"
  end
end
