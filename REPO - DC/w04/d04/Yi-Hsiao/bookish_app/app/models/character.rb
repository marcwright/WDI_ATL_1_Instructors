class Character < ActiveRecord::Base
  has_many :authors, through: :books
  has_and_belongs_to_many :books
end
