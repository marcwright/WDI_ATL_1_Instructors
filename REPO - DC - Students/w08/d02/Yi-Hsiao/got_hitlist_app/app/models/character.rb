class Character < ActiveRecord::Base
  validates :name, presence: true, uniqueness: :name
end
