class Episode < ActiveRecord::Base
  has_many :appearances
  has_many :rounds
  has_many :chefs
  has_many :judges, through: :appearances
end
