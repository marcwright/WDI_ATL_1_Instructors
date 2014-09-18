class Entry < ActiveRecord::Base
  validates :author, presence: true
  validates :photo_url, presence: true
  validates :date_taken, presence: true
  validate :date_taken_cannot_be_before_oct_2010

  def date_taken_cannot_be_before_oct_2010
    if date_taken < Date.new(2010, 10, 1)
      errors.add(:date_taken, "must be before October 2010")
    end
  end
end
