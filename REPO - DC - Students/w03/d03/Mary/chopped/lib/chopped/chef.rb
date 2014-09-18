class Chef < ActiveRecord::Base
  has_many :dishes
  has_many :rounds, :through => :dishes
  belongs_to :episode

  validates :name,
    presence: true
end
