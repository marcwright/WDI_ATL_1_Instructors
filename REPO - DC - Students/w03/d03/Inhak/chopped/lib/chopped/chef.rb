class Chef < ActiveRecord::Base
  has_many :dishes
  belongs_to :episode

  validates_presence_of :name, :age, :gender
  validates_associated :episode, :dishes
end
