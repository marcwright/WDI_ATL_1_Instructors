#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-14 19:17:42
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-14 20:31:23

class Entry < ActiveRecord::Base
  validates :author, presence: true
  validates :photo_url, presence: true
  validate :date_taken_must_be_recent

  def date_taken_must_be_recent
    if date_taken < Date.new(2010, 10, 1)
      errors.add(:date_taken, "must be recent")
    end
  end
end
