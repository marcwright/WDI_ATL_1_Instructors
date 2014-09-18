#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-16 15:34:43
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-16 19:21:57

class Band < ActiveRecord::Base
  validates :name, presence: true, length: { in: 2..25 }
  validates :genre, presence: true, length: { in: 2..25 }
  validates :video_embed_url, presence: true

  has_many :events
end
