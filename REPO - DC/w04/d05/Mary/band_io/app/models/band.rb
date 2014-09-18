class Band < ActiveRecord::Base
  has_many :events, dependent: :destroy
  has_many :venues, through: :events
end
