#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-16 15:21:22
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-16 19:22:20

class Venue < ActiveRecord::Base
  validates :name, presence: true, length: { in: 2..40 }
  validates :city, presence: true, length: { in: 2..40 }
  validates :state, presence: true, length: { is: 2 }

  has_many :events
end
