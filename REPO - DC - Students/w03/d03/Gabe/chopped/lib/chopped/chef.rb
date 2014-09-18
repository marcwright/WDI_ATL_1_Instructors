class Chef < ActiveRecord::Base
  validates_presence_of :chef_name
  has_many :rounds, through: :appearances
  belongs_to :appearances
  has_many :dishes
  has_many :scores, through: :dishes
end


