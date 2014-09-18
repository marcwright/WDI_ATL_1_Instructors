class Person < ActiveRecord::Base
  attr_accessible :account_number, :dob, :name, :title
  has_many :articles, foreign_key: :author

  validates :name, presence: true
  validates :name, uniqueness: true
end
