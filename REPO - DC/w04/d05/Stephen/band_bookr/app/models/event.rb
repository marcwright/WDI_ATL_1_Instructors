  #!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-16 15:25:26
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-16 19:42:15

class Event < ActiveRecord::Base
  validates :date, presence: true
  validates :time, presence: true

  validate :date_must_be_this_millenium

  belongs_to :band
  belongs_to :venue

  def date_must_be_this_millenium
    if date < Date.new(2000, 1, 1) || date > Date.new(3000, 1, 1)
      errors.add(:date, "must be in the 2000s")
    end
  end

  def to_s
    return "#{self.band.name} at the #{self.venue.name}"
  end

end
