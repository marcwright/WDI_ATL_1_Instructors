class Round < ActiveRecord::Base
  has_many :dishes
  has_many :chefs, :through => :dishes
  belongs_to :episode

  validates :round_number,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 1,
      less_than_or_equal_to: 3
    }

end
