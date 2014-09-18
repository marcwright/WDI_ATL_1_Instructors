class Entry < ActiveRecord::Base
  validates :author, presence: true;

  validates :photo_url, presence: true;

  validates :date_taken, numericality: {greater_than: 2010-01-10}

end
