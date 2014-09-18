class Character < ActiveRecord::Base
  belongs_to :book

  validates :name, presence:true
end
